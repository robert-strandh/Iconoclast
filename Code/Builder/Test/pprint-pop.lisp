(cl:in-package #:iconoclast-builder-test)

(define-test pprint-pop
  (compare-parse-and-unparse '(pprint-pop)))
