(cl:in-package #:iconoclast-builder-test)

(define-test setq)

(define-test setq-empty
  :parent setq
  (compare-parse-and-unparse '(setq)))

(define-test setq-one-pair
  :parent setq
  (compare-parse-and-unparse '(setq a 234)))

(define-test setq-two-pairs
  :parent setq
  (compare-parse-and-unparse '(setq a 234 b 345)))
