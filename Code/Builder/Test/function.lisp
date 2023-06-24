(cl:in-package #:iconoclast-builder-test)

(define-test function)

(define-test function-and-symbol
  :parent function
  (compare-parse-and-unparse '(function f)))

(define-test function-and-lambda-expression
  :parent function
  (compare-parse-and-unparse '(function (lambda ()))))
