(cl:in-package #:iconoclast-builder-test)

(define-test with-condition-restarts)

(define-test with-condition-restarts-no-forms
  :parent with-condition-restarts
  (compare-parse-and-unparse
   '(with-condition-restarts x y)))

(define-test with-condition-restarts-one-form
  :parent with-condition-restarts
  :depends-on (with-condition-restarts-no-forms)
  (compare-parse-and-unparse
   '(with-condition-restarts x y z)))

(define-test with-condition-restarts-two-forms
  :parent with-condition-restarts
  :depends-on (with-condition-restarts-no-forms)
  (compare-parse-and-unparse
   '(with-condition-restarts x y z w)))
