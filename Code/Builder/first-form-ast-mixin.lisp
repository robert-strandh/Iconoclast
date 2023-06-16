(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :first-form))
     (left ico:first-form-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :first-form-ast right))
