(cl:in-package #:iconoclast-builder-test)

(define-test with-package-iterator)

(define-test with-package-iterator-empty
  :parent with-package-iterator
  (compare-parse-and-unparse
   '(with-package-iterator (x y))))

(define-test with-package-iterator-symbol-type-internal
  :parent with-package-iterator
  :depends-on (with-package-iterator-empty)
  (compare-parse-and-unparse
   '(with-package-iterator (x y :internal))))

(define-test with-package-iterator-symbol-type-external
  :parent with-package-iterator
  :depends-on (with-package-iterator-empty)
  (compare-parse-and-unparse
   '(with-package-iterator (x y :external))))

(define-test with-package-iterator-symbol-type-inherited
  :parent with-package-iterator
  :depends-on (with-package-iterator-empty)
  (compare-parse-and-unparse
   '(with-package-iterator (x y :inherited))))

(define-test with-package-iterator-declaration
  :parent with-package-iterator
  :depends-on (with-package-iterator-empty)
  (compare-parse-and-unparse
   '(with-package-iterator (x y) (declare (inline f)))))

(define-test with-package-iterator-one-body-form
  :parent with-package-iterator
  :depends-on (with-package-iterator-empty)
  (compare-parse-and-unparse
   '(with-package-iterator (x y) z)))

(define-test with-package-iterator-two-body-forms
  :parent with-package-iterator
  :depends-on (with-package-iterator-empty)
  (compare-parse-and-unparse
   '(with-package-iterator (x y) z w)))
