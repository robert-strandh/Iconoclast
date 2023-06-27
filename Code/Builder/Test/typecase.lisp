(cl:in-package #:iconoclast-builder-test)

(define-test typecase)

(define-test typecase-no-clauses
  :parent typecase
  (compare-parse-and-unparse '(typecase)))

(define-test typecase-one-clause-no-form
  :parent typecase
  (compare-parse-and-unparse '(typecase (t))))

(define-test typecase-one-clause-one-form
  :parent typecase
  (compare-parse-and-unparse '(typecase (t 234))))

(define-test typecase-one-clause-two-forms
  :parent typecase
  (compare-parse-and-unparse '(typecase (t 234 345))))

(define-test typecase-two-clauses
  :parent typecase
  (compare-parse-and-unparse '(typecase (fixnum 11) (t 234 345))))

(define-test typecase-otherwise-clause-no-form
  :parent typecase
  (compare-parse-and-unparse '(typecase (otherwise))))

(define-test typecase-otherwise-clause-with-form
  :parent typecase
  (compare-parse-and-unparse '(typecase (otherwise x))))

(define-test typecase-normal-and-otherwise-clause-with-form
  :parent typecase
  (compare-parse-and-unparse '(typecase (t a) (otherwise x))))


