(cl:in-package #:iconoclast-builder)

(define-make-node-method :tagbody ico:tagbody-ast)

(define-make-node-method :tagbody-segment ico:tagbody-segment-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :tag))
     (left ico:tagbody-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :contents-asts (append (ico:contents-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :label))
     (left ico:tagbody-segment-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :tag-asts (append (ico:tag-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :statement))
     (left ico:tagbody-segment-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
