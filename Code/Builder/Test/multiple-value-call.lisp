(cl:in-package #:iconoclast-builder-test)

(define-test multiple-value-call)

(define-test multiple-value-call-only-function-form
  :parent multiple-value-call
  (compare-parse-and-unparse '(multiple-value-call a)))
