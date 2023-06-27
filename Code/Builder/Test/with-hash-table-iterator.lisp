(cl:in-package #:iconoclast-builder-test)

(define-test with-hash-table-iterator)

(define-test with-hash-table-iterator-empty
  :parent with-hash-table-iterator
  (compare-parse-and-unparse
   '(with-hash-table-iterator (x y))))

(define-test with-hash-table-iterator-declaration
  :parent with-hash-table-iterator
  (compare-parse-and-unparse
   '(with-hash-table-iterator (x y) (declare (inline f)))))

(define-test with-hash-table-iterator-one-form
  :parent with-hash-table-iterator
  (compare-parse-and-unparse
   '(with-hash-table-iterator (x y) z)))

(define-test with-hash-table-iterator-two-forms
  :parent with-hash-table-iterator
  (compare-parse-and-unparse
   '(with-hash-table-iterator (x y) z w)))
