(cl:in-package #:iconoclast-builder-test)

(define-test formatter
  (compare-parse-and-unparse '(formatter "hello")))
