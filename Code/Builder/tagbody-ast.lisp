(cl:in-package #:iconoclast-builder)

(define-make-node-method :tagbody ico:tagbody-ast)

(define-make-node-method :tagbody-segment ico:tagbody-segment-ast)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :tag))
     &key name source)
  (make-instance 'ico:tag-ast
    :origin source
    :name name))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :segment))
     (left ico:tagbody-ast)
     (right ico:tagbody-segment-ast)
     &key)
  (reinitialize-instance left
    :segment-asts (append (ico:segment-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :label))
     (left ico:tagbody-segment-ast)
     (right ico:tag-ast)
     &key)
  (reinitialize-instance left
    :tag-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :statement))
     (left ico:tagbody-segment-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
