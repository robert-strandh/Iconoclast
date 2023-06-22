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

(define-make-node-method :environment-section ico:environment-section-ast)

(define-make-node-method :whole-section ico:whole-section-ast)

(define-make-node-method :required-parameter ico:required-parameter-ast)

(define-make-node-method :optional-parameter ico:optional-parameter-ast)

(define-make-node-method :keyword-parameter ico:key-parameter-ast)

(define-make-node-method :aux-parameter ico:aux-parameter-ast)

(defmethod abp:node-kind
    ((builder builder) (node ico:required-parameter-ast))
  :required-parameter)

(define-relations ico:required-section-ast-mixin
  ((:required-section t ico:required-section-ast)))

(define-relations ico:optional-section-ast-mixin
  ((:optional-section t ico:optional-section-ast)))

(define-relations ico:rest-section-ast-mixin
  ((:rest-section t ico:rest-section-ast)))

(define-relations ico:key-section-ast-mixin
  ((:keyword-section t ico:key-section-ast)))

(define-relations ico:aux-section-ast-mixin
  ((:aux-section t ico:aux-section-ast)))

(define-relations ico:environment-section-ast-mixin
  ((:en-section t ico:environment-section-ast)))

(define-relations ico:whole-section-ast-mixin
  ((:whole-section t ico:whole-section-ast)))

(define-relations ico:parameter-ast
  ((:name t ico:name-ast)))

(define-relations ico:lambda-list-keyword-ast-mixin
  ((:keyword t ico:name-ast)))

(define-relations ico:key-parameter-ast
  ((:keyword t ico:keyword-ast)))

(define-relations ico:aux-parameter-ast
  ((:value t ico:init-form-ast)))

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

(define-relations ico:single-parameter-section-ast
  ((:parameter t ico:parameter-ast)))

(define-relations ico:multi-parameter-section-ast
  ((:parameter t ico:parameter-asts)))

(define-relations ico:lambda-list-ast-mixin
  ((:lambda-list ico:lambda-list-ast ico:lambda-list-ast)))

(define-relations ico:init-form-ast-mixin
  ((:default t ico:init-form-ast)))

(define-relations ico:supplied-p-parameter-ast-mixin
  ((:supplied t ico:supplied-p-parameter-ast)))

(define-make-node-method :pattern ico:pattern-ast)

(defmethod abp:node-kind ((buildern builder) (node ico:pattern-ast))
  :pattern)

(defmethod abp:node-relation
    ((builder builder)
     (relation (eql :name))
     (parameter-ast ico:required-parameter-ast))
  (ico:name (ico:name-ast parameter-ast)))

