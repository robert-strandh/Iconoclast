(cl:in-package #:iconoclast-builder-test)

(define-test with-slots)

(define-test with-slots-empty
  :parent with-slots
  (compare-parse-and-unparse
   '(with-slots () x)))

(define-test with-slots-one-slot-symbol
  :parent with-slots
  :depends-on (with-slots-empty)
  (compare-parse-and-unparse
   '(with-slots (x) y)))

(define-test with-slots-one-slot-list
  :parent with-slots
  :depends-on (with-slots-empty)
  (compare-parse-and-unparse
   '(with-slots ((x z)) y)))

(define-test with-slots-two-slots
  :parent with-slots
  :depends-on (with-slots-empty)
  (compare-parse-and-unparse
   '(with-slots ((x z) w) y)))

(define-test with-slots-declaration
  :parent with-slots
  :depends-on (with-slots-empty)
  (compare-parse-and-unparse
   '(with-slots ((x z)) y (declare (inline f)))))

(define-test with-slots-one-form
  :parent with-slots
  :depends-on (with-slots-empty)
  (compare-parse-and-unparse
   '(with-slots ((x z)) y w)))

(define-test with-slots-two-forms
  :parent with-slots
  :depends-on (with-slots-empty)
  (compare-parse-and-unparse
   '(with-slots ((x z)) y w v)))
