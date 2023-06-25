(cl:in-package #:iconoclast-builder-test)

(define-test or)

(define-test or-empty
  :parent or
  (compare-parse-and-unparse '(or)))

(define-test or-one-argument
  :parent or
  (compare-parse-and-unparse '(or x)))

(define-test or-two-arguments
  :parent or
  (compare-parse-and-unparse '(or x y)))
