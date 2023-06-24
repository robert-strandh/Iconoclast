(cl:in-package #:iconoclast-builder-test)

(define-test catch)

(define-test catch-no-body
  :parent catch
  (compare-parse-and-unparse '(catch 234)))
