(cl:in-package #:iconoclast-builder-test)

(define-test block)

(define-test block-no-body
  :parent block
  (compare-parse-and-unparse '(block hello)))
