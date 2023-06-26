(cl:in-package #:iconoclast-builder-test)

(define-test defvar)

(define-test defvar-no-initial-value
  :parent defvar
  (compare-parse-and-unparse '(defvar a)))

(define-test defvar-no-documentation
  :parent defvar
  (compare-parse-and-unparse '(defvar a b)))

(define-test defvar-documentation
  :parent defvar
  (compare-parse-and-unparse '(defvar a b "hello")))
