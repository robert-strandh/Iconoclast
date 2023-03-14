(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :documentation))
     (left ico:documentation-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :documentation-ast right))
