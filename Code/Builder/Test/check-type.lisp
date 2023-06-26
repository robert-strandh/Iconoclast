(cl:in-package #:iconoclast-builder-test)

(define-test check-type)

(define-test check-type-simple-typespec-no-string
  :parent check-type
  (compare-parse-and-unparse '(check-type x t)))

(define-test check-type-simple-typespec-and-string
  :parent check-type
  (compare-parse-and-unparse '(check-type x t "hello")))
