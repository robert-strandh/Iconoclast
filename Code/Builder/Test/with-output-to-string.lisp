(cl:in-package #:iconoclast-builder-test)

(define-test with-output-to-string)

(define-test with-output-to-string-empty
  :parent with-output-to-string
  (compare-parse-and-unparse
   '(with-output-to-string (x))))

(define-test with-output-to-string-with-string-form
  :parent with-output-to-string
  (compare-parse-and-unparse
   '(with-output-to-string (x y))))

(define-test with-output-to-string-with-element-type
  :parent with-output-to-string
  (compare-parse-and-unparse
   '(with-output-to-string (x y :element-type z))))

(define-test with-output-to-string-declaration
  :parent with-output-to-string
  (compare-parse-and-unparse
   '(with-output-to-string (x) (declare (inline f)))))

(define-test with-output-to-string-one-body-form
  :parent with-output-to-string
  (compare-parse-and-unparse
   '(with-output-to-string (x) y)))

(define-test with-output-to-string-two-body-forms
  :parent with-output-to-string
  (compare-parse-and-unparse
   '(with-output-to-string (x) y z)))
