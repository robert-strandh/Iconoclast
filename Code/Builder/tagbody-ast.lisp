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

(define-relations ico:tagbody-segment-ast
  ((:label ico:tag-ast ico:tag-ast)
   (:statement t ico:form-asts)))
