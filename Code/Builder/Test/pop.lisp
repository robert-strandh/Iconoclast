(cl:in-package #:iconoclast-builder-test)

(define-test pop
  (compare-parse-and-unparse '(pop x)))
