(cl:in-package #:iconoclast-builder-test)

(define-test ccase)

(define-test ccase-no-clauses
  :parent ccase
  (compare-parse-and-unparse '(ccase x)))

(define-test ccase-one-clause-atomic-key-no-form
  :parent ccase
  (compare-parse-and-unparse '(ccase x (y))))

(define-test ccase-one-clause-atomic-key-one-form
  :parent ccase
  (compare-parse-and-unparse '(ccase x (y a))))

(define-test ccase-one-clause-atomic-key-two-forms
  :parent ccase
  (compare-parse-and-unparse '(ccase x (y a a))))

(define-test ccase-one-clause-singleton-key-no-form
  :parent ccase
  (compare-parse-and-unparse '(ccase x ((y)))))

(define-test ccase-one-clause-two-keys-no-form
  :parent ccase
  (compare-parse-and-unparse '(ccase x ((y z)))))
