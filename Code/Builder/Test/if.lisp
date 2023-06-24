(cl:in-package #:iconoclast-builder-test)

(define-test if)

(define-test if-no-forms
  :parent if
  (fail (parse-and-unparse '(if))))
  
(define-test if-only-test
  :parent if
  (fail (parse-and-unparse '(if 234))))
  
(define-test if-no-else
  :parent if
  (compare-parse-and-unparse '(if 234 345)))

(define-test if-also-else
  :parent if
  (compare-parse-and-unparse '(if 234 345 456)))
