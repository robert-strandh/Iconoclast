(cl:in-package #:iconoclast-builder)

(define-make-node-method :defvar ico:defvar-ast)

(define-make-node-method :defparameter ico:defparameter-ast)

(define-relations ico:defvar-or-defparameter-ast
  ((:name t ico:variable-name-ast)))

;;; The following two must be separate because the form is optional in
;;; DEFVAR but required in DEFPARAMETER.

(define-relations ico:defvar-ast
  ((:initial-value ico:unparsed-form-ast ico:form-ast)))

(define-relations ico:defparameter-ast
  ((:initial-value ico:unparsed-form-ast ico:form-ast)))
