(cl:in-package #:iconoclast-ast-walker)

;;;; This function implements a general AST walker.  All it does it
;;;; traverse the AST tree without invoking any action.  To implement
;;;; some action, client code can define an :AROUND method on
;;;; WALK-AST-NODE that specializes to a particular CLIENT class.
;;;; That :AROUND method can then implement actions before or after
;;;; recursive processing takes place, or call WALK-AST-NODE
;;;; recursively with some new AST node.  If the client-provided
;;;; :AROUND method does not end up calling CALL-NEXT-METHOD it must
;;;; return an AST which the walker will substitute into the AST tree
;;;; in place of the original AST.

;;;; As it turns out, the AST tree is not quite a tree in that ASTs
;;;; defining variables, functions, block names, and tagbody tags are
;;;; linked to their referencing ASTS, and vice versa.  We want to
;;;; avoid such traversal, not only becase it would give us an
;;;; infinite computation, but we want to traverse such pairs of ASTS
;;;; as if those links do not exist.  We handle this situation by
;;;; defining an intermediate generic function MAYBE-WALK that takes
;;;; two ASTs and calls WALK-AST-NODE only when appropriate.

(defgeneric walk-ast-node (client node))

(defgeneric maybe-walk (client parent-node child-node))

;;; By default, we call WALK-AST-NODE.
(defmethod maybe-walk (client parent-node child-node)
  (walk-ast-node client child-node))

(defmethod maybe-walk (client (parent-node ico:function-name-ast) child-node)
  child-node)

(defmethod maybe-walk (client (parent-node ico:variable-name-ast) child-node)
  child-node)

(defmethod maybe-walk (client (parent-node ico:block-name-ast) child-node)
  child-node)

;;; A TAG-AST is considered a leaf, be it a definition or a reference.
(defmethod maybe-walk (client (parent-node ico:tag-ast) child-node)
  child-node)

(defmethod walk-ast-node (client node)
  node)

(defun set-slot (ast reader-name value)
  (let* ((symbol-name (symbol-name reader-name))
         (initarg (intern symbol-name (find-package "KEYWORD"))))
    (reinitialize-instance ast initarg value)))

(defmethod walk-ast-node (client (ast iconoclast:ast))
  (loop for (cardinality slot-reader) in (iconoclast:slot-designators ast)
        do (ecase cardinality
             (*
              (set-slot ast slot-reader
                        (loop for child in (funcall slot-reader ast)
                              collect (maybe-walk client ast child))))
             (iconoclast:?
              (let ((possible-child (funcall slot-reader ast)))
                (unless (null possible-child)
                  (set-slot ast slot-reader
                            (maybe-walk client ast possible-child)))))
             (1
              (let ((child (funcall slot-reader ast)))
                (set-slot ast slot-reader
                          (maybe-walk client ast child))))))
  ast)

(defvar *visited*)

(defmethod walk-ast-node :around (client node)
  (if (gethash node *visited*)
      node
      (progn 
        (setf (gethash node *visited*) t)
        (call-next-method))))

(defgeneric walk-ast (client ast))

(defmethod walk-ast (client ast)
  (let ((*visited* (make-hash-table :test #'eq)))
    (walk-ast-node client ast)))
