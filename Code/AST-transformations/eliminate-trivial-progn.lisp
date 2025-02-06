(cl:in-package #:iconoclast-ast-transformations)

(defclass eliminate-trivial-progn-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client eliminate-trivial-progn-client) (ast ico:progn-ast))
  (call-next-method)
  (let ((form-asts (ico:form-asts ast)))
    (if (= 1 (length form-asts))
        (first form-asts)
        ast)))

(defun eliminate-trivial-progn (ast)
  (let ((client (make-instance 'eliminate-trivial-progn-client)))
    (iaw:walk-ast client ast)))
