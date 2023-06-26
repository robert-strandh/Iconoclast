(cl:in-package #:iconoclast-builder-test)

(define-test incf)

(define-test incf-no-increment
  :parent incf
  (compare-parse-and-unparse '(incf x)))

(define-test incf-with-increment
  :parent incf
  (compare-parse-and-unparse '(incf x y)))
