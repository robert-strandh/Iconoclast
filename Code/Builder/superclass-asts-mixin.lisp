(cl:in-package #:iconoclast-builder)

;;; For DEFCLASS the relation is :SUPERCLASS and for DEFINE-CONDITION
;;; the relation is :PARENT-TYPE, so we need two different methods.

(define-relations ico:superclass-asts-mixin
  ((:superclass t ico:superclass-asts)))
