(cl:in-package #:iconoclast-builder-test)

(define-test declaim)

(define-test declaim-empty
  :parent declaim
  (compare-parse-and-unparse '(declaim)))

(define-test declaim-one-simple-proclamation
  :parent declaim
  (compare-parse-and-unparse '(declaim (inline f))))

(define-test declaim-one-simple-proclamation
  :parent declaim
  (compare-parse-and-unparse '(declaim (inline f) (inline g))))
