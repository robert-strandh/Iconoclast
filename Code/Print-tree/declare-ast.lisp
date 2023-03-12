(cl:in-package #:iconoclast-print-tree)

(defmethod children ((ast ico:declare-ast))
  (list (cons "declaration-specifier-asts"
              (ico:declaration-specifier-asts ast))))
