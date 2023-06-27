(cl:in-package #:iconoclast-builder-test)

(define-test pprint-exit-if-list-exhausted
  (compare-parse-and-unparse '(pprint-exit-if-list-exhausted)))
