(cl:in-package #:iconoclast-builder-test)

(define-test throw)

(define-test throw-simple-body
  :parent throw
  (compare-parse-and-unparse '(throw 234 345)))
