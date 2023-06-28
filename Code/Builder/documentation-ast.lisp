(cl:in-package #:iconoclast-builder)

(define-make-node-method :documentation ico:documentation-ast)

(defmethod abp:node-initargs
    ((builder builder)
     (ast ico:documentation-ast))
  (list :string (ico:%string ast)))
