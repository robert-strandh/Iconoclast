(cl:in-package #:iconoclast-builder-test)

(define-test shiftf)
(define-test shiftf-one-place
  :parent shiftf
  (compare-parse-and-unparse
   '(shiftf a x)))

(define-test shiftf-two-places
  :parent shiftf
  (compare-parse-and-unparse
   '(shiftf a b x)))

(define-test shiftf-three-places
  :parent shiftf
  (compare-parse-and-unparse
   '(shiftf a b c x)))
