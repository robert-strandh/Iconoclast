(cl:in-package #:iconoclast-builder-test)

(define-test case)

(define-test case-no-clauses
  :parent case
  (compare-parse-and-unparse '(case x)))

(define-test case-one-normal-clause-atomic-key-no-form
  :parent case
  (compare-parse-and-unparse '(case x (y))))

(define-test case-one-normal-clause-atomic-key-one-form
  :parent case
  (compare-parse-and-unparse '(case x (y a))))

(define-test case-one-normal-clause-atomic-key-two-forms
  :parent case
  (compare-parse-and-unparse '(case x (y a a))))

(define-test case-one-normal-clause-singleton-key-no-form
  :parent case
  (compare-parse-and-unparse '(case x ((y)))))

(define-test case-one-normal-clause-two-keys-no-form
  :parent case
  (compare-parse-and-unparse '(case x ((y z)))))

(define-test case-one-otherwise-clause-no-form
  :parent case
  (compare-parse-and-unparse '(case x (otherwise))))

(define-test case-one-t-clause-no-form
  :parent case
  (is #'equal
      '(case x (otherwise))
      (parse-and-unparse '(case x (t)))))

(define-test case-one-otherwise-clause-one-form
  :parent case
  (compare-parse-and-unparse '(case x (otherwise y))))

(define-test case-one-otherwise-clause-two-forms
  :parent case
  (compare-parse-and-unparse '(case x (otherwise y z))))
