(cl:in-package #:iconoclast-builder-test)

(define-test with-accessors)

(define-test with-accessors-no-slot-entries
  :parent with-accessors
  (compare-parse-and-unparse
   '(with-accessors () x)))

(define-test with-accessors-one-slot-entry
  :parent with-accessors
  (compare-parse-and-unparse
   '(with-accessors ((a b)) x)))

(define-test with-accessors-two-slot-entries
  :parent with-accessors
  (compare-parse-and-unparse
   '(with-accessors ((a b) (c d)) x)))

(define-test with-accessors-declaration
  :parent with-accessors
  (compare-parse-and-unparse
   '(with-accessors ((a b) (c d)) x (declare (inline f)))))

(define-test with-accessors-one-body-form
  :parent with-accessors
  (compare-parse-and-unparse
   '(with-accessors ((a b) (c d)) x y)))

(define-test with-accessors-two-body-forms
  :parent with-accessors
  (compare-parse-and-unparse
   '(with-accessors ((a b) (c d)) x y z)))
