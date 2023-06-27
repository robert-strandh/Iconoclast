(cl:in-package #:iconoclast-builder-test)

(define-test unless)

(define-test unless-only-test
  :parent unless
  (compare-parse-and-unparse
   '(unless x)))

(define-test unless-one-body-form
  :parent unless
  (compare-parse-and-unparse
   '(unless x y)))

(define-test unless-two-body-forms
  :parent unless
  (compare-parse-and-unparse
   '(unless x y z)))
