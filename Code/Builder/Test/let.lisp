(cl:in-package #:iconoclast-builder-test)

(define-test let)

(define-test let-empty
  :parent let
  (compare-parse-and-unparse '(let ())))

(define-test let-no-initform-no-body
  :parent let
  (compare-parse-and-unparse '(let (x))))

(define-test let-no-initform-simple-body
  :parent let
  (compare-parse-and-unparse '(let (x) y)))

(define-test let-initform-no-body
  :parent let
  (compare-parse-and-unparse '(let ((x 10)) y)))
