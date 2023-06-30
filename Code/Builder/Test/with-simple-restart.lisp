(cl:in-package #:iconoclast-builder-test)

(define-test with-simple-restart)

(define-test with-simple-restart-empty
  :parent with-simple-restart
  (compare-parse-and-unparse
   '(with-simple-restart (x y))))

(define-test with-simple-restart-one-format-argument
  :parent with-simple-restart
  :depends-on (with-simple-restart-empty)
  (compare-parse-and-unparse
   '(with-simple-restart (x y z))))

(define-test with-simple-restart-two-format-arguments
  :parent with-simple-restart
  :depends-on (with-simple-restart-empty)
  (compare-parse-and-unparse
   '(with-simple-restart (x y z w))))

(define-test with-simple-restart-one-form
  :parent with-simple-restart
  :depends-on (with-simple-restart-empty)
  (compare-parse-and-unparse
   '(with-simple-restart (x y) z)))

(define-test with-simple-restart-two-forms
  :parent with-simple-restart
  :depends-on (with-simple-restart-empty)
  (compare-parse-and-unparse
   '(with-simple-restart (x y) z w)))
