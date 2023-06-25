(cl:in-package #:iconoclast-builder-test)

(define-test assert)

(define-test assert-just-test-form
  :parent assert
  (compare-parse-and-unparse '(assert x)))

(define-test assert-just-one-place
  :parent assert
  (compare-parse-and-unparse '(assert x (y))))

(define-test assert-one-place-and-datum-form
  :parent assert
  (compare-parse-and-unparse '(assert x (y) z)))

(define-test assert-one-place-and-datum-form-and-one-argument
  :parent assert
  (compare-parse-and-unparse '(assert x (y) z w)))

(define-test assert-one-place-and-datum-form-and-two-arguments
  :parent assert
  (compare-parse-and-unparse '(assert x (y) z w v)))
