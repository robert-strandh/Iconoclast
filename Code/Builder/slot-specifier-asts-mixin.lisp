(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :slot))
     (left ico:slot-specifier-asts-mixin)
     (right ico:slot-specifier-ast)
     &key)
  (reinitialize-instance left
    :slot-specifier-asts
    (append (ico:slot-specifier-asts left) (list right))))
