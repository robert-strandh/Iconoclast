(cl:in-package #:iconoclast-builder-test)

(define-test unwind-protect)

(define-test unwind-protect-no-cleanup
  :parent unwind-protect
  (compare-parse-and-unparse '(unwind-protect 234)))
