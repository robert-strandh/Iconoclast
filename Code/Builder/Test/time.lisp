(cl:in-package #:iconoclast-builder-test)

(define-test time
  (compare-parse-and-unparse '(time x)))
