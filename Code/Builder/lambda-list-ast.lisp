(cl:in-package #:iconoclast-builder)

(define-make-node-method :required-parameter ico:required-parameter-ast)

(define-make-node-method :optional-parameter ico:optional-parameter-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:required-parameter-ast))
  :required-parameter)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:parameter-ast)
     (right ico:name-ast)
     &key)
  (reinitialize-instance left :name-ast right))

(define-make-node-method
    :ordinary-lambda-list ico:ordinary-lambda-list-ast)

(define-make-node-method
    :generic-function-lambda-list ico:generic-function-lambda-list-ast)

(define-make-node-method
    :specialized-lambda-list ico:specialized-lambda-list-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :required))
     (left ico:required-parameter-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :required-parameter-asts
    (append (ico:required-parameter-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :optional))
     (left ico:optional-parameter-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :optional-parameter-asts
    (append (ico:optional-parameter-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda-list))
     (left ico:lambda-list-ast-mixin)
     (right ico:lambda-list-ast)
     &key)
  (reinitialize-instance left :lambda-list-ast right))
