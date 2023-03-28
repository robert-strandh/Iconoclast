(cl:in-package #:iconoclast-builder)

(define-make-node-method :lambda-expression ico:lambda-expression-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda-list))
     (left ico:function-definition-ast)
     (right ico:lambda-list-ast)
     &key)
  (reinitialize-instance left
    :lambda-list-ast right))
