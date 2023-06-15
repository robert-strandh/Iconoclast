(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :delta))
     (left ico:delta-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :delta-ast right))
