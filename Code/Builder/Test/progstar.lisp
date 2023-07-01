(cl:in-package #:iconoclast-builder-test)

(define-test prog*)

(define-test prog*-no-var
  :parent prog*
  (compare-parse-and-unparse
   '(prog* ())))

(define-test prog*-one-var-symbol
  :parent prog*
  (compare-parse-and-unparse
   '(prog* (x))))

(define-test prog*-one-var-list
  :parent prog*
  (is #'equal
      (parse-and-unparse '(prog* ((x))))
      '(prog* (x))))

(define-test prog*-one-var-initform
  :parent prog*
  (compare-parse-and-unparse
   '(prog* ((x 234)))))

(define-test prog*-two-vars
  :parent prog*
  (compare-parse-and-unparse
   '(prog* ((x 234) w))))

(define-test prog*-declaration
  :parent prog*
  (compare-parse-and-unparse
   '(prog* (x y) (declare (inline f)))))

(define-test prog*-tag
  :parent prog*
  (compare-parse-and-unparse
   '(prog* (x y) 234)))

(define-test prog*-tag-and-statement
  :parent prog*
  (compare-parse-and-unparse
   '(prog* (x y) 234 (f x))))
