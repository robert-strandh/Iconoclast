(cl:in-package #:iconoclast-builder-test)

(define-test step
  (compare-parse-and-unparse '(step x)))
