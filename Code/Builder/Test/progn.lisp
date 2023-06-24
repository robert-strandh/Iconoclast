(cl:in-package #:iconoclast-builder-test)

(define-test progn)

(define-test progn-no-forms
  :parent progn
  (compare-parse-and-unparse '(progn)))
