(cl:in-package #:iconoclast-builder-test)

(define-test with-input-from-string)

(define-test with-input-from-string-empty
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y))))

(define-test with-input-from-string-index
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y :index z))))

(define-test with-input-from-string-start
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y :start z))))

(define-test with-input-from-string-end
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y :end z))))

(define-test with-input-from-string-declaration
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y) (declare (inline f)))))

(define-test with-input-from-string-one-form
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y) z)))

(define-test with-input-from-string-two-forms
  :parent with-input-from-string
  (compare-parse-and-unparse
   '(with-input-from-string (x y) z w)))
