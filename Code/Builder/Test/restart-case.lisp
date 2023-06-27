(cl:in-package #:iconoclast-builder-test)

(define-test restart-case)

(define-test restart-case-no-clauses
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x)))

(define-test restart-case-one-clause-no-options
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z)))))

(define-test restart-case-one-clause-interactive-symbol
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :interactive f))))

(define-test restart-case-one-clause-interactive-lambda
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :interactive (lambda ())))))

(define-test restart-case-one-clause-report-string
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :report "hello"))))

(define-test restart-case-one-clause-report-symbol
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :report f))))

(define-test restart-case-one-clause-report-lambda
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :report (lambda (s))))))

(define-test restart-case-one-clause-test-symbol
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :test f))))

(define-test restart-case-one-clause-test-lambda
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :test (lambda (c))))))

(define-test restart-case-two-clauses
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :test (lambda (c)))
                    (y (z)))))

(define-test restart-case-two-clauses-declaration
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :test (lambda (c)))
                    (y (z) (declare (inline f))))))

(define-test restart-case-two-clauses-one-form
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :test (lambda (c)))
                    (y (z) a))))

(define-test restart-case-two-clauses-two-form
  :parent restart-case
  (compare-parse-and-unparse
   '(restart-case x (y (z) :test (lambda (c)))
                    (y (z) a b))))
