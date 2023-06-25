(cl:in-package #:iconoclast-builder-test)

(define-test and)

(define-test and-empty
  :parent and
  (compare-parse-and-unparse '(and)))

(define-test and-one-argument
  :parent and
  (compare-parse-and-unparse '(and x)))

(define-test and-two-arguments
  :parent and
  (compare-parse-and-unparse '(and x y)))
