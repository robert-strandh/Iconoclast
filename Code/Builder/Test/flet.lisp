(cl:in-package #:iconoclast-builder-test)

(define-test flet)

(define-test labels)

(define-test macrolet)

(define-test flet-no-functions-no-body
  :parent flet
  (compare-parse-and-unparse '(flet ())))

(define-test flet-one-function-no-body
  :parent flet
  (compare-parse-and-unparse '(flet ((f ())))))

(define-test labels-no-functions-no-body
  :parent labels
  (compare-parse-and-unparse '(labels ())))

(define-test labels-one-function-no-body
  :parent labels
  (compare-parse-and-unparse '(labels ((f ())))))

(define-test macrolet-no-functions-no-body
  :parent macrolet
  (compare-parse-and-unparse '(macrolet ())))

(define-test macrolet-one-function-no-body
  :parent macrolet
  (compare-parse-and-unparse '(macrolet ((f ())))))
