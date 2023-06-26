(cl:in-package #:iconoclast-builder-test)

(define-test etypecase)

(define-test etypecase-no-clauses
  :parent etypecase
  (compare-parse-and-unparse '(etypecase)))

(define-test etypecase-one-clause-no-form
  :parent etypecase
  (compare-parse-and-unparse '(etypecase (t))))

(define-test etypecase-one-clause-one-form
  :parent etypecase
  (compare-parse-and-unparse '(etypecase (t 234))))

(define-test etypecase-one-clause-two-forms
  :parent etypecase
  (compare-parse-and-unparse '(etypecase (t 234 345))))

(define-test etypecase-two-clauses
  :parent etypecase
  (compare-parse-and-unparse '(etypecase (fixnum 11) (t 234 345))))
