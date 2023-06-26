(cl:in-package #:iconoclast-builder-test)

(define-test define-symbol-macro
  (compare-parse-and-unparse '(define-symbol-macro f g)))
