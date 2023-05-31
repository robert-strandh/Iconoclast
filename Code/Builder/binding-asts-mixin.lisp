(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :binding))
     (left ico:binding-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :binding-asts
    (append (ico:binding-asts left) (list right))))
