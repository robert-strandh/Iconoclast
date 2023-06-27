(cl:in-package #:iconoclast-builder-test)

;;; We assume that the same code is used everywhere for parsing an
;;; ordinary lambda list, and that code is tested elsewhere.

(define-test lambda)

(define-test lambda-empty
  :parent lambda
  (compare-parse-and-unparse
   '(lambda ())))

(define-test lambda-one-required
  :parent lambda
  (compare-parse-and-unparse
   '(lambda (x))))

(define-test lambda-declaration
  :parent lambda
  (compare-parse-and-unparse
   '(lambda (x) (declare (inline f)))))

(define-test lambda-documentation
  :parent lambda
  (compare-parse-and-unparse
   '(lambda (x) "doc" y)))

(define-test lambda-one-form
  :parent lambda
  (compare-parse-and-unparse
   '(lambda (x) y)))

(define-test lambda-two-forms
  :parent lambda
  (compare-parse-and-unparse
   '(lambda (x) y z)))
