(cl:in-package #:iconoclast-builder)

(define-make-node-method :tagbody ico:tagbody-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :tag))
     (left ico:tagbody-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :contents-asts (append (ico:contents-asts left) (list right))))
