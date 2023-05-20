(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :initform))
     (left ico:initform-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :initform-ast right))
