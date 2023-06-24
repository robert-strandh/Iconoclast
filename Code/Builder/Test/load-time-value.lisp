(cl:in-package #:iconoclast-builder-test)

(define-test load-time-value)

(define-test load-time-value-simple-form
  :parent load-time-value
  (compare-parse-and-unparse '(load-time-value 234)))
