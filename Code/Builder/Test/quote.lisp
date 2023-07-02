(cl:in-package #:iconoclast-builder-test)

(define-test quote)

(define-test quote-simple-object
  :parent quote
  (skip "Results in Parachute error"
    (compare-parse-and-unparse '(quote 234))))
