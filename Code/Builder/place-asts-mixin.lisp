(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :place))
     (left ico:place-asts-mixin)
     (right ico:place-ast)
     &key)
  (reinitialize-instance left
    :place-asts (append (ico:place-asts left) (list right))))
