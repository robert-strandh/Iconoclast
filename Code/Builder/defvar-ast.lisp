(cl:in-package #:iconoclast-builder)

(define-make-node-method :defvar ico:defvar-ast)

(define-make-node-method :defparameter ico:defparameter-ast)

(define-relations ico:defvar-or-defparameter-ast
  ((:name t ico:variable-name-ast)
   (:initial-value ico:unparsed-form-ast ico:form-ast)))
