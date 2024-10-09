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

(defclass call-graph-client (client)
  ((%ast-info :initarg :ast-info :reader ast-info)))

(defmethod iaw:walk-ast-node :around
    ((client call-graph-client) (ast ico:local-function-ast))
  (call-next-method)
  (let* ((name-ast (ico:name-ast ast))
         (reference-asts (ico:local-function-name-reference-asts name-ast)))
    (loop with ast-info = (ast-info client)
          for reference-ast in reference-asts
          for parent-ast = (parent-ast reference-ast ast-info)
          when (and (typep parent-ast 'ico:application-ast)
                    (eq reference-ast (ico:function-name-ast parent-ast)))
            do (let ((caller-ast (owner-ast parent-ast ast-info)))
                 (pushnew caller-ast
                          (function-caller-asts ast ast-info)
                          :test #'eq)
                 (pushnew ast
                          (function-callee-asts caller-ast ast-info)
                          :test #'eq))))
  ast)

(defun compute-call-graph (ast ast-info)
  (let ((call-graph-client
          (make-instance 'call-graph-client :ast-info ast-info)))
    (iaw:walk-ast call-graph-client ast)
    call-graph-client))
