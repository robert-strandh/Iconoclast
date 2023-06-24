(cl:in-package #:iconoclast-builder-test)

(define-test progv)

(define-test progv-simple-forms
  :parent progv
  (compare-parse-and-unparse '(progv a b)))
