(cl:in-package #:iconoclast-builder-test)

(define-test with-standard-io-syntax)

(define-test with-standard-io-syntax-empty
  :parent with-standard-io-syntax
  (compare-parse-and-unparse
   '(with-standard-io-syntax)))

(define-test with-standard-io-syntax-one-form
  :parent with-standard-io-syntax
  (compare-parse-and-unparse
   '(with-standard-io-syntax x)))

(define-test with-standard-io-syntax-two-forms
  :parent with-standard-io-syntax
  (compare-parse-and-unparse
   '(with-standard-io-syntax x y)))
