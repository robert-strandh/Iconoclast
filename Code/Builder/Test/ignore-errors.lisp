(cl:in-package #:iconoclast-builder-test)

(define-test ignore-errors)

(define-test ignore-errors-empty
  :parent ignore-errors
  (compare-parse-and-unparse
   '(ignore-errors)))

(define-test ignore-errors-one-form
  :parent ignore-errors
  (compare-parse-and-unparse
   '(ignore-errors x)))

(define-test ignore-errors-two-forms
  :parent ignore-errors
  (compare-parse-and-unparse
   '(ignore-errors x y)))
