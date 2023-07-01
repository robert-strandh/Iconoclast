(cl:in-package #:iconoclast-builder-test)

(define-test ecase)

(define-test ecase-no-clauses
  :parent ecase
  (compare-parse-and-unparse '(ecase x)))

(define-test ecase-one-clause-atomic-key-no-form
  :parent ecase
  (is #'equal
      (parse-and-unparse '(ecase x (y)))
      '(ecase x ((y)))))

(define-test ecase-one-clause-atomic-key-one-form
  :parent ecase
  (is #'equal
      (parse-and-unparse '(ecase x (y a)))
      '(ecase x ((y) a))))

(define-test ecase-one-clause-atomic-key-two-forms
  :parent ecase
  (is #'equal
      (parse-and-unparse '(ecase x (y a a)))
      '(ecase x ((y) a a))))

(define-test ecase-one-clause-singleton-key-no-form
  :parent ecase
  (compare-parse-and-unparse '(ecase x ((y)))))

(define-test ecase-one-clause-two-keys-no-form
  :parent ecase
  (compare-parse-and-unparse '(ecase x ((y z)))))
