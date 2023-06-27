(cl:in-package #:iconoclast-builder-test)

(define-test multiple-value-list
  (compare-parse-and-unparse '(multiple-value-list x)))
