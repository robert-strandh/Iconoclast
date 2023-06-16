(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :segment))
     (left ico:segment-asts-mixin)
     (right ico:tagbody-segment-ast)
     &key)
  (reinitialize-instance left
    :segment-asts (append (ico:segment-asts left) (list right))))
