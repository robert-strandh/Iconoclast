(cl:in-package #:iconoclast-builder-test)

(define-test setf)

(define-test setf-empty
  :parent setf
  (compare-parse-and-unparse
   '(setf)))

(define-test setf-one-pair
  :parent setf
  (compare-parse-and-unparse
   '(setf a b)))

(define-test setf-two-pairs
  :parent setf
  (compare-parse-and-unparse
   '(setf a b c d)))
