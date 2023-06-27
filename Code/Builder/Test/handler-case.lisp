(cl:in-package #:iconoclast-builder-test)

;;; We assume that the same code is used everywhere for parsing type
;;; specifiers, and that code is tested elsewhere so we won't test it
;;; again here.

;;; Similarly, we assume that the same code is used everywhere for
;;; parsing an ordinary lambda list, and that code is tested
;;; elsewhere.

(define-test handler-case)

(define-test handler-case-empty
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x)))

(define-test handler-case-one-error-clause-no-parameter
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (s ()))))

(define-test handler-case-one-error-clause-parameter
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (s (y)))))

(define-test handler-case-one-error-clause-declaration
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (s (y) (declare (inline f))))))

(define-test handler-case-one-error-clause-form
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (s (y) z))))

(define-test handler-case-no-error-clause
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (:no-error (x)))))

(define-test handler-case-no-error-clause-declaration
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (:no-error (x) (declare (inline f))))))

(define-test handler-case-no-error-clause-form
  :parent handler-case
  (compare-parse-and-unparse
   '(handler-case x (:no-error (x) y))))
