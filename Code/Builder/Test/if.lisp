(cl:in-package #:iconoclast-builder-test)

(define-test test-if)

(define-test test-if-no-forms
  :parent test-if
  (fail (parse-and-unparse '(if))))
  
(define-test test-if-only-test
  :parent test-if
  (fail (parse-and-unparse '(if 234))))
  
(define-test test-if-no-else
  :parent test-if
  (compare-parse-and-unparse '(if 234 345)))

(define-test test-if-also-else
  :parent test-if
  (compare-parse-and-unparse '(if 234 345 456)))
