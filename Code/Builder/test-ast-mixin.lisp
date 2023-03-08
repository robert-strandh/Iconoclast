(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :test))
     (left ico:test-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :test-ast right))
