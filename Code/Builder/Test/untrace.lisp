(cl:in-package #:iconoclast-builder-test)

(define-test untrace)

(define-test untrace-empty
  :parent untrace
  (compare-parse-and-unparse
   '(untrace)))

(define-test untrace-one-symbol
  :parent untrace
  (compare-parse-and-unparse
   '(untrace f)))

(define-test untrace-one-setf
  :parent untrace
  (compare-parse-and-unparse
   '(untrace (setf f))))

(define-test untrace-two-functions
  :parent untrace
  (compare-parse-and-unparse
   '(untrace f (setf f))))
