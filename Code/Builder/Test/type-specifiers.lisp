(cl:in-package #:iconoclast-builder-test)

(define-test type)

(define-test type-1
  :parent type
  (compare-parse-and-unparse '(the fixnum a)))

(define-test type-2
  :parent type
  (compare-parse-and-unparse '(the (integer 2 3) a)))

(define-test type-3
  :parent type
  (compare-parse-and-unparse '(the (array) a)))

(define-test type-4
  :parent type
  (compare-parse-and-unparse '(the (array fixnum) a)))
