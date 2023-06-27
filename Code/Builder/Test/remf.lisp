(cl:in-package #:iconoclast-builder-test)

(define-test remf
  (compare-parse-and-unparse
   '(remf a b)))
