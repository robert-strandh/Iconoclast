(cl:in-package #:iconoclast-builder-test)

(define-test dotimes)

(define-test dotimes-empty
  :parent dotimes
  (compare-parse-and-unparse
   '(dotimes (w x))))

(define-test dotimes-result
  :parent dotimes
  (compare-parse-and-unparse
   '(dotimes (w x y))))

(define-test dotimes-declaration
  :parent dotimes
  (compare-parse-and-unparse
   '(dotimes (w x y) (declare (inline f)))))

(define-test dotimes-tag
  :parent dotimes
  (compare-parse-and-unparse
   '(dotimes (w x y) 234)))

(define-test dotimes-statement
  :parent dotimes
  (compare-parse-and-unparse
   '(dotimes (w x y) (f x))))

(define-test dotimes-tag-and-statement
  :parent dotimes
  (compare-parse-and-unparse
   '(dotimes (w x y) 234 (f x))))
