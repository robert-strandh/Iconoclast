(cl:in-package #:iconoclast-builder-test)

(define-test return)

(define-test return-1
  :parent return
  (compare-parse-and-unparse '(return)))

(define-test return-2
  :parent return
  (compare-parse-and-unparse '(return 234)))
