(cl:in-package #:iconoclast-builder-test)

(define-test multiple-value-prog1)

(define-test multiple-value-prog1-no-body
  :parent multiple-value-prog1
  (compare-parse-and-unparse '(multiple-value-prog1 a)))
