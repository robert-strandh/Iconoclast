(cl:in-package #:iconoclast-builder-test)

(define-test multiple-value-setq)

(define-test multiple-value-setq-empty
  :parent multiple-value-setq
  (compare-parse-and-unparse
   '(multiple-value-setq () x)))

(define-test multiple-value-setq-one-variable
  :parent multiple-value-setq
  :depends-on (multiple-value-setq-empty)
  (compare-parse-and-unparse
   '(multiple-value-setq (x) y)))

(define-test multiple-value-setq-two-variables
  :parent multiple-value-setq
  :depends-on (multiple-value-setq-empty)
  (compare-parse-and-unparse
   '(multiple-value-setq (x y) z)))
