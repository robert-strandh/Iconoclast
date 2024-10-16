(cl:in-package #:iconoclast-ast-transformations)

;;; Since we have done alpha conversion, we no longer need the
;;; FUNCTION-AST.

(defclass eliminate-function-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client eliminate-function-client) (ast ico:function-ast))
  (call-next-method)
  (ico:name-ast ast))

(defun eliminate-function (ast)
  (let ((client (make-instance 'eliminate-function-client)))
    (iaw:walk-ast client ast)))
