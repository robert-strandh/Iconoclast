(cl:in-package #:iconoclast-builder)

(define-make-node-method :tagbody ico:tagbody-ast)

(define-make-node-method :tagbody-segment ico:tagbody-segment-ast)

(define-make-node-method :tag ico:tag-ast)

(define-relations ico:tagbody-segment-ast
  ((:label ico:tag-ast ico:tag-ast)
   (:statement t ico:statement-asts)))

(defmethod abp:relate :after
    ((builder builder)
     (relation (eql :label))
     (left ico:tagbody-segment-ast)
     (right ico:tag-ast)
     &key)
  (reinitialize-instance right :segment-ast left))

(defmethod abp:relate :after
    ((builder builder)
     (relation (eql :segment))
     (left ico:tagbody-ast)
     (right ico:tagbody-segment-ast)
     &key)
  (reinitialize-instance right :tagbody-ast left))
