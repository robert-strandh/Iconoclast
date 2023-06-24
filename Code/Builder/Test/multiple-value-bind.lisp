(cl:in-package #:iconoclast-builder-test)

(define-test multiple-value-bind)

(define-test multiple-value-bind-1
  :parent multiple-value-bind
  (compare-parse-and-unparse '(multiple-value-bind () (f x))))

(define-test multiple-value-bind-2
  :parent multiple-value-bind
  (compare-parse-and-unparse '(multiple-value-bind (x y) (f x))))
