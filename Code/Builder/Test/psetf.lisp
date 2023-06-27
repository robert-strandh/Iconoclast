(cl:in-package #:iconoclast-builder-test)

(define-test psetf)

(define-test psetf-empty
  :parent psetf
  (compare-parse-and-unparse
   '(psetf)))

(define-test psetf-one-pair
  :parent psetf
  (compare-parse-and-unparse
   '(psetf a b)))

(define-test psetf-two-pairs
  :parent psetf
  (compare-parse-and-unparse
   '(psetf a b c d)))
