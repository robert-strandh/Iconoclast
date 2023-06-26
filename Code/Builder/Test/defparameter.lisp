(cl:in-package #:iconoclast-builder-test)

(define-test defparameter)

(define-test defparameter-no-documentation
  :parent defparameter
  (compare-parse-and-unparse '(defparameter a b)))

(define-test defparameter-documentation
  :parent defparameter
  (compare-parse-and-unparse '(defparameter a b "hello")))
