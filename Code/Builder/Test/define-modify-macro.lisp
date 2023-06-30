(cl:in-package #:iconoclast-builder-test)

(define-test define-modify-macro)

(define-test define-modify-macro-empty-lambda-list
  :parent define-modify-macro
  (compare-parse-and-unparse '(define-modify-macro a () b)))

(define-test define-modify-macro-one-required
  :parent define-modify-macro
  :depends-on (define-modify-macro-empty-lambda-list) 
  (compare-parse-and-unparse '(define-modify-macro a (x) b)))

(define-test define-modify-macro-one-optional-symbol
  :parent define-modify-macro
  :depends-on (define-modify-macro-empty-lambda-list) 
  (compare-parse-and-unparse '(define-modify-macro a (&optional x) b)))

(define-test define-modify-macro-one-optional-list
  :parent define-modify-macro
  :depends-on (define-modify-macro-empty-lambda-list) 
  (compare-parse-and-unparse '(define-modify-macro a (&optional (x)) b)))

(define-test define-modify-macro-one-optional-initform
  :parent define-modify-macro
  :depends-on (define-modify-macro-empty-lambda-list) 
  (compare-parse-and-unparse
   '(define-modify-macro a (&optional (x 234)) b)))

(define-test define-modify-macro-one-optional-supplied-p
  :parent define-modify-macro
  :depends-on (define-modify-macro-empty-lambda-list) 
  (compare-parse-and-unparse
   '(define-modify-macro a (&optional (x 234 y)) b)))

(define-test define-modify-macro-rest
  :parent define-modify-macro
  :depends-on (define-modify-macro-empty-lambda-list) 
  (compare-parse-and-unparse '(define-modify-macro a (&rest x) b)))
