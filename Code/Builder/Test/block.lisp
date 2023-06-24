(cl:in-package #:iconoclast-builder-test)

(define-test block-1
  (compare-parse-and-unparse '(block hello)))
