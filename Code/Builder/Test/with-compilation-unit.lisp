(cl:in-package #:iconoclast-builder-test)

(define-test with-compilation-unit)

(define-test with-compilation-unit-empty
  :parent with-compilation-unit
  (compare-parse-and-unparse
   '(with-compilation-unit ())))

(define-test with-compilation-unit-with-option
  :parent with-compilation-unit
  :depends-on (with-compilation-unit-empty)
  (compare-parse-and-unparse
   '(with-compilation-unit (:override x))))

(define-test with-compilation-unit-one-form
  :parent with-compilation-unit
  :depends-on (with-compilation-unit-empty)
  (compare-parse-and-unparse
   '(with-compilation-unit () x)))

(define-test with-compilation-unit-two-forms
  :parent with-compilation-unit
  :depends-on (with-compilation-unit-empty)
  (compare-parse-and-unparse
   '(with-compilation-unit () x y)))

(define-test with-compilation-unit-option-and-forms
  :parent with-compilation-unit
  :depends-on (with-compilation-unit-empty)
  (compare-parse-and-unparse
   '(with-compilation-unit (:override x) y z)))
