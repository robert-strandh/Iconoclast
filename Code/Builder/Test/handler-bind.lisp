(cl:in-package #:iconoclast-builder-test)

;;; We assume that the same code is used everywhere for
;;; parsing type specifiers, and that code is tested
;;; elsewhere so we won't test it again here.

(define-test handler-bind)

(define-test handler-bind-empty
  :parent handler-bind
  (compare-parse-and-unparse
   '(handler-bind ())))

(define-test handler-bind-one-binding
  :parent handler-bind
  (compare-parse-and-unparse
   '(handler-bind ((x y)))))

(define-test handler-bind-two-bindings
  :parent handler-bind
  (compare-parse-and-unparse
   '(handler-bind ((x y) (z w)))))

(define-test handler-bind-one-form
  :parent handler-bind
  (compare-parse-and-unparse
   '(handler-bind ((x y)) z)))

(define-test handler-bind-two-forms
  :parent handler-bind
  (compare-parse-and-unparse
   '(handler-bind ((x y)) z w)))
