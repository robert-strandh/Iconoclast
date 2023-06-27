(cl:in-package #:iconoclast-builder-test)

(define-test nth-value
  (compare-parse-and-unparse
   '(nth-value x y)))
