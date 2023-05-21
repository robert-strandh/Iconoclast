(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :superclass))
     (left ico:superclass-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :superclass-asts (append (ico:superclass-asts left) (list right))))
