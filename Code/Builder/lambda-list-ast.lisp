(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :lambda-list-keyword))
     &key keyword)
  (make-instance 'ico:lambda-list-keyword-ast
    :name keyword))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :keyword))
     &key name)
  (make-instance 'ico:keyword-ast
    :name name))

(define-make-node-method :required-section ico:required-section-ast)

(define-make-node-method :optional-section ico:optional-section-ast)

(define-make-node-method :rest-section ico:rest-section-ast)

(define-make-node-method :keyword-section ico:key-section-ast)

(define-make-node-method :aux-section ico:aux-section-ast)

(define-make-node-method :required-parameter ico:required-parameter-ast)

(define-make-node-method :optional-parameter ico:optional-parameter-ast)

(define-make-node-method :keyword-parameter ico:key-parameter-ast)

(define-make-node-method :aux-parameter ico:aux-parameter-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:required-parameter-ast))
  :required-parameter)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :required-section))
     (left ico:required-section-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :required-section-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :optional-section))
     (left ico:optional-section-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :optional-section-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :rest-section))
     (left ico:rest-section-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :rest-section-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyword-section))
     (left ico:key-section-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :key-section-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :aux-section))
     (left ico:aux-section-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :aux-section-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:parameter-ast)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyword))
     (left ico:lambda-list-keyword-ast-mixin)
     (right t)
     &key)
  (reinitialize-instance left :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :keyword))
     (left ico:key-parameter-ast)
     (right t)
     &key)
  (reinitialize-instance left :keyword-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :value))
     (left ico:aux-parameter-ast)
     (right t)
     &key)
  (reinitialize-instance left :init-form-ast right))

(define-make-node-method
    :ordinary-lambda-list ico:ordinary-lambda-list-ast)

(define-make-node-method
    :generic-function-lambda-list ico:generic-function-lambda-list-ast)

(define-make-node-method
    :specialized-lambda-list ico:specialized-lambda-list-ast)

(define-make-node-method
    :destructuring-lambda-list ico:destructuring-lambda-list-ast)

(define-make-node-method
    :deftype-lambda-list ico:deftype-lambda-list-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :parameter))
     (left ico:single-parameter-section-ast)
     (right t)
     &key)
  (reinitialize-instance left :parameter-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :parameter))
     (left ico:multi-parameter-section-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :parameter-asts
    (append (ico:parameter-asts left) (list right))))

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

(defmethod abp:node-relation
    ((builder builder)
     (relation (eql :name))
     (parameter-ast ico:required-parameter-ast))
  (ico:name (ico:name-ast parameter-ast)))

