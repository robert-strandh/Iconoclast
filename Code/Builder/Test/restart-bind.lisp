(cl:in-package #:iconoclast-builder-test)

(define-test restart-bind)

(define-test restart-bind-empty
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ())))

(define-test restart-bind-one-clause-no-pairs
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y)))))

(define-test restart-bind-one-clause-interactive-function
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y :interactive-function z)))))

(define-test restart-bind-one-clause-report-function
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y :report-function z)))))

(define-test restart-bind-one-clause-test-function
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y :test-function z)))))

(define-test restart-bind-two-clauses
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y) (z w)))))

(define-test restart-bind-two-clauses-one-form
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y) (z w)) a)))

(define-test restart-bind-two-clauses-two-forms
  :parent restart-bind
  (compare-parse-and-unparse
   '(restart-bind ((x y) (z w)) a b)))
