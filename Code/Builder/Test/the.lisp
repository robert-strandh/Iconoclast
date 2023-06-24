(cl:in-package #:iconoclast-builder-test)

(define-test the-t
  (compare-parse-and-unparse '(the t 234)))
