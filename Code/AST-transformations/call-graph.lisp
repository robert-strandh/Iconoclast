(cl:in-package #:iconoclast-ast-transformations)

;;; We compute a call graph of local functions.  For each
;;; LOCAL-FUNCTION-AST, we find its NAME-AST which is a
;;; LOCAL-FUNCTION-NAME-DEFINITION-AST.  We then find the
;;; LOCAL-NAME-REFERERENCE-ASTS of that
;;; LOCAL-FUNCTION-NAME-DEFINITION-AST, each of which is a
;;; FUNCTION-REFERENCE-AST.  If the parent if that
;;; FUNCTION-REFERENCE-AST is an APPLICATION-AST, and the
;;; FUNCTION-REFERENCE-AST is the FUNCTION-NAME-AST of the
;;; APPLICATION-AST, then the owner of the APPLICATION-AST is a
;;; caller.

(defclass node ()
  (;; This slot contains the LOCAL-FUNCTION-AST represented by this
   ;; node.
   (%function-ast :initarg :function-ast :reader function-ast)
   ;; This slot contains a list nodes, each of which represents a
   ;; caller of the LOCAL-FUNCTION-AST represented by this node.
   ;; Elements are added to this list as new callers are found.
   (%caller-nodes :initform '() :accessor caller-nodes)
   ;; This slot contains a list of nodes, each of which represents a
   ;; callee of the LOCAL-FUNCTION-AST represented by this node.
   (%callee-nodes :initform '() :accessor callee-nodes)))

(defclass call-graph-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defclass create-nodes-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defmethod iaw:walk-ast-node :around
    ((client call-graph-client) (ast ico:local-function-ast))
  (call-next-method)
  (let* ((name-ast (ico:name-ast ast))
         (reference-asts (ico:local-function-name-reference-asts name-ast)))
    (loop with callee-node = (gethash ast (node-table (ast-info client)))
          for reference-ast in reference-asts
          for parent = (parent reference-ast (ast-info client))
          when (and (typep parent 'ico:application-ast)
                    (eq reference-ast (ico:function-name-ast parent)))
            do (let* ((owner-ast (owner parent (ast-info client)))
                      (caller-node
                        (gethash owner-ast (node-table (ast-info client)))))
                 (pushnew caller-node
                          (caller-nodes callee-node)
                          :test #'eq)
                 (pushnew callee-node
                          (callee-nodes caller-node)
                          :test #'eq))))
  ast)

(defmethod iaw:walk-ast-node :around
    ((client create-nodes-client) (ast ico:local-function-ast))
  (call-next-method)
  (setf (gethash ast (node-table (ast-info client)))
        (make-instance 'node :function-ast ast))
  ast)

(defun compute-call-graph (ast ast-info)
  (let ((create-nodes-client
          (make-instance 'create-nodes-client :ast-info ast-info)))
    (iaw:walk-ast create-nodes-client ast)
    ;; We need a node for NIL which is owner of outermost ASTs.
    (setf (gethash nil (node-table ast-info))
          (make-instance 'node :function-ast nil))
    (let ((call-graph-client
            (make-instance 'call-graph-client :ast-info ast-info)))
      (iaw:walk-ast call-graph-client ast)
      call-graph-client)))
