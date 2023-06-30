(cl:in-package #:iconoclast-builder-test)

(define-test define-method-combination)

(define-test define-method-combination-short-form-no-options
  :parent define-method-combination
  (compare-parse-and-unparse
   '(define-method-combination a)))

(define-test define-method-combination-short-form-documentation
  :parent define-method-combination
  :depends-on (define-method-combination-short-form-no-options)
  (compare-parse-and-unparse
   '(define-method-combination a :documentation "hello")))

(define-test define-method-combination-short-form-identity-with-one-argument
  :parent define-method-combination
  :depends-on (define-method-combination-short-form-no-options)
  (compare-parse-and-unparse
   '(define-method-combination a :identity-with-one-argument x)))

(define-test define-method-combination-short-form-operator
  :parent define-method-combination
  :depends-on (define-method-combination-short-form-no-options)
  (compare-parse-and-unparse
   '(define-method-combination a :operator b)))
