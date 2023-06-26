(cl:in-package #:iconoclast-builder-test)

(define-test ctypecase)

(define-test ctypecase-no-clauses
  :parent ctypecase
  (compare-parse-and-unparse '(ctypecase)))

(define-test ctypecase-one-clause-no-form
  :parent ctypecase
  (compare-parse-and-unparse '(ctypecase (t))))

(define-test ctypecase-one-clause-one-form
  :parent ctypecase
  (compare-parse-and-unparse '(ctypecase (t 234))))

(define-test ctypecase-one-clause-two-forms
  :parent ctypecase
  (compare-parse-and-unparse '(ctypecase (t 234 345))))

(define-test ctypecase-two-clauses
  :parent ctypecase
  (compare-parse-and-unparse '(ctypecase (fixnum 11) (t 234 345))))
