(cl:in-package #:iconoclast-builder-test)

(define-test cond)

(define-test cond-no-clauses
  :parent cond
  (compare-parse-and-unparse '(cond)))

(define-test cond-one-degenerate-clause
  :parent cond
  (compare-parse-and-unparse '(cond (x))))

(define-test cond-one-clause-one-form
  :parent cond
  (compare-parse-and-unparse '(cond (x y))))

(define-test cond-one-clause-two-forms
  :parent cond
  (compare-parse-and-unparse '(cond (x y z))))

(define-test cond-two-clauses
  :parent cond
  (compare-parse-and-unparse '(cond (x y z) (w v))))
