(cl:in-package #:iconoclast-builder-test)

(define-test push
  (compare-parse-and-unparse
   '(push a b)))
