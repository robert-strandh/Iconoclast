(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :clause))
     (left ico:clause-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :clause-asts (append (ico:clause-asts left) (list right))))
