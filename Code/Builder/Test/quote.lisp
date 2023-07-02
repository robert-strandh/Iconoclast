(cl:in-package #:iconoclast-builder-test)

(define-test quote)

(define-test quote-simple-object
  :parent quote
  (compare-parse-and-unparse '(quote 234)))
