(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :place))
     (left ico:place-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :place-ast right))
