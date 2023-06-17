(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :object))
     (left ico:object-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :object-ast right))
