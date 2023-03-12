(cl:in-package #:iconoclast-print-tree)

(defmethod children ((ast ico:let-or-let*-ast))
  (list (cons "variable-binding-asts"
              (ico:variable-binding-asts ast))
        (cons "declaration-asts"
              (ico:declaration-asts ast))
        (cons "form-asts"
              (ico:form-asts ast))))

(defmethod children ((ast ico:variable-binding-ast))
  (list (cons "variable-ast" (ico:variable-ast ast))
        (cons "form-ast" (ico:form-ast ast))))
