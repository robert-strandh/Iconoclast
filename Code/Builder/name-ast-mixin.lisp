(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:name-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))
