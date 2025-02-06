(cl:in-package #:iconoclast-ast-transformations)

(defclass replace-trivial-locally-by-progn-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client replace-trivial-locally-by-progn-client) (ast ico:locally-ast))
  (call-next-method)
  (when (loop for declaration-ast in (ico:declaration-asts ast)
              always (null (ico:declaration-specifier-asts declaration-ast)))
    (change-class ast 'ico:progn-ast))
  ast)

(defun replace-trivial-locally-by-progn (ast)
  (let ((client (make-instance 'replace-trivial-locally-by-progn-client)))
    (iaw:walk-ast client ast)))
