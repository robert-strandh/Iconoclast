(cl:in-package #:iconoclast-builder)

(define-make-node-method :go ico:go-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :tag))
     (left ico:go-ast)
     (right ico:tag-ast)
     &key)
  (reinitialize-instance left :tag-ast right))
