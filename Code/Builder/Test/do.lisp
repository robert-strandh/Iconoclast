(cl:in-package #:iconoclast-builder-test)

(define-test do)

(define-test do-no-var-no-result
  :parent do
  (compare-parse-and-unparse
   '(do () (x))))

(define-test do-no-var-one-result
  :parent do
  (compare-parse-and-unparse
   '(do () (x y))))

(define-test do-no-var-two-results
  :parent do
  (compare-parse-and-unparse
   '(do () (x y z))))

(define-test do-one-var-symbol
  :parent do
  (compare-parse-and-unparse
   '(do (x) (y))))

(define-test do-one-var-list
  :parent do
  (compare-parse-and-unparse
   '(do ((x)) (y))))

(define-test do-one-var-initform
  :parent do
  (compare-parse-and-unparse
   '(do ((x 234)) (y))))

(define-test do-one-var-step-form
  :parent do
  (compare-parse-and-unparse
   '(do ((x 234 y)) (y))))

(define-test do-two-vars
  :parent do
  (compare-parse-and-unparse
   '(do ((x 234 y) w) (z))))

(define-test do-declaration
  :parent do
  (compare-parse-and-unparse
   '(do (x y) (z) (declare (inline f)))))

(define-test do-tag
  :parent do
  (compare-parse-and-unparse
   '(do (x y) (z) 234)))

(define-test do-tag-and-statement
  :parent do
  (compare-parse-and-unparse
   '(do (x y) (z) 234 (f x))))
