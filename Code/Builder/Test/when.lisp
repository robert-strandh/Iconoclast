(cl:in-package #:iconoclast-builder-test)

(define-test when)

(define-test when-only-test
  :parent when
  (compare-parse-and-unparse
   '(when x)))

(define-test when-one-body-form
  :parent when
  (compare-parse-and-unparse
   '(when x y)))

(define-test when-two-body-forms
  :parent when
  (compare-parse-and-unparse
   '(when x y z)))
