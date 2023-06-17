(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :result))
     (left ico:result-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :result-ast right))
