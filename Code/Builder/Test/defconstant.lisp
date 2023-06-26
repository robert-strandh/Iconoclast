(cl:in-package #:iconoclast-builder-test)

(define-test defconstant)

(define-test defconstant-no-documentation
  :parent defconstant
  (compare-parse-and-unparse '(defconstant foo bar)))

(define-test defconstant-with-documentation
  :parent defconstant
  (compare-parse-and-unparse '(defconstant foo bar "doc")))
