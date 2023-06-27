(cl:in-package #:iconoclast-builder-test)

(define-test psetq)

(define-test psetq-empty
  :parent psetq
  (compare-parse-and-unparse
   '(psetq)))

(define-test psetq-one-pair
  :parent psetq
  (compare-parse-and-unparse
   '(psetq a b)))

(define-test psetq-two-pairs
  :parent psetq
  (compare-parse-and-unparse
   '(psetq a b c d)))
