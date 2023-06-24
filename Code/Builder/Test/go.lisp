(cl:in-package #:iconoclast-builder-test)

(define-test go)

(define-test go-integer
  :parent go
  (compare-parse-and-unparse '(go 234)))

(define-test go-symbol
  :parent go
  (compare-parse-and-unparse '(go a)))
