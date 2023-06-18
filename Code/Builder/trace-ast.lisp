(cl:in-package #:iconoclast-builder)

(define-make-node-method :trace ico:trace-ast)

(define-make-node-method :untrace ico:untrace-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :function-name))
     (left ico:function-name-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :function-name-asts (append (ico:function-name-asts left) (list right))))
