(cl:in-package #:iconoclast-builder)

(define-make-node-method :specialized-parameter ico:specialized-parameter-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:specialized-parameter-ast)
     (right ico:variable-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :specializer))
     (left ico:specialized-parameter-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :specializer-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :required))
     (left ico:specialized-lambda-list-ast)
     (right ico:specialized-parameter-ast)
     &key)
  (reinitialize-instance left
    :required-asts (append (ico:required-asts left) (list right))))

(define-make-node-method
    :specialized-lambda-list ico:specialized-lambda-list-ast)

(define-make-node-method :defmethod ico:defmethod-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defmethod-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))
