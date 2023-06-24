(cl:in-package #:iconoclast-builder-test)

(define-test return-from)

(define-test return-from-no-form
  :parent return-from
  (compare-parse-and-unparse '(return-from hello)))

(define-test return-from-with-form
  :parent return-from
  (compare-parse-and-unparse '(return-from hello 234)))
