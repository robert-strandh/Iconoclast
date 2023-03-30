(cl:in-package #:iconoclast-builder)

(define-make-node-method :required-parameter ico:required-parameter-ast)

(define-make-node-method :optional-parameter ico:optional-parameter-ast)

(define-make-node-method :keyword-parameter ico:key-parameter-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:required-parameter-ast))
  :required-parameter)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:parameter-ast)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))

(define-make-node-method
    :ordinary-lambda-list ico:ordinary-lambda-list-ast)

(define-make-node-method
    :generic-function-lambda-list ico:generic-function-lambda-list-ast)

(define-make-node-method
    :specialized-lambda-list ico:specialized-lambda-list-ast)

(define-make-node-method
    :destructuring-lambda-list ico:destructuring-lambda-list-ast)

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
     (relation (eql :keyword))
     (left ico:key-parameter-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :key-parameter-asts
    (append (ico:key-parameter-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :lambda-list))
     (left ico:lambda-list-ast-mixin)
     (right ico:lambda-list-ast)
     &key)
  (reinitialize-instance left :lambda-list-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :default))
     (left ico:init-form-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :init-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :supplied))
     (left ico:supplied-p-parameter-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :supplied-p-parameter-ast right))

(define-make-node-method :pattern ico:pattern-ast)

(defmethod abp:node-kind ((buildern builder) (node ico:pattern-ast))
  :pattern)
