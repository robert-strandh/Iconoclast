(cl:in-package #:iconoclast-builder-test)

(define-test the)

(define-test the-t
  :parent the
  (compare-parse-and-unparse '(the t 234)))
