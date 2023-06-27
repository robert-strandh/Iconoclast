(cl:in-package #:iconoclast-builder-test)

(define-test rotatef)

(define-test rotatef-empty
  :parent rotatef
  (compare-parse-and-unparse
   '(rotatef)))

(define-test rotatef-one-place
  :parent rotatef
  (compare-parse-and-unparse
   '(rotatef a)))

(define-test rotatef-two-places
  :parent rotatef
  (compare-parse-and-unparse
   '(rotatef a b)))

(define-test rotatef-three-places
  :parent rotatef
  (compare-parse-and-unparse
   '(rotatef)))
