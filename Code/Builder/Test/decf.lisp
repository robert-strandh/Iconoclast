(cl:in-package #:iconoclast-builder-test)

(define-test decf)

(define-test decf-no-increment
  :parent decf
  (compare-parse-and-unparse '(decf x)))

(define-test decf-with-increment
  :parent decf
  (compare-parse-and-unparse '(decf x y)))
