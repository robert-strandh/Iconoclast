(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (kind (eql :argument))
     (left ico:name-asts-mixin)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :variable-asts (append (ico:name-asts left) (list right))))
