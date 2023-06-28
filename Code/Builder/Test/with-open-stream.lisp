(cl:in-package #:iconoclast-builder-test)

(define-test with-open-stream)

(define-test with-open-stream-empty
  :parent with-open-stream
  (compare-parse-and-unparse
   '(with-open-stream (x y))))

(define-test with-open-stream-declaration
  :parent with-open-stream
  (compare-parse-and-unparse
   '(with-open-stream (x y) (declare (inline f)))))

(define-test with-open-stream-one-body-form
  :parent with-open-stream
  (compare-parse-and-unparse
   '(with-open-stream (x y) z)))

(define-test with-open-stream-two-body-forms
  :parent with-open-stream
  (compare-parse-and-unparse
   '(with-open-stream (x y) z w)))
