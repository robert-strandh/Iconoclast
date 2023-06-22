(cl:in-package #:iconoclast-builder)

(define-make-node-method :prog2 ico:prog2-ast)

;;; FIXME: A better choice for the relation would have been
;;; :SECOND-FORM.

(define-relations ico:prog2-ast
  ((:second t ico:second-form-ast)))
