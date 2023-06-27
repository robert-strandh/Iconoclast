(cl:in-package #:iconoclast-builder-test)

(define-test trace)

(define-test trace-empty
  :parent trace
  (compare-parse-and-unparse
   '(trace)))

(define-test trace-one-symbol
  :parent trace
  (compare-parse-and-unparse
   '(trace f)))

(define-test trace-one-setf
  :parent trace
  (compare-parse-and-unparse
   '(trace (setf f))))

(define-test trace-two-functions
  :parent trace
  (compare-parse-and-unparse
   '(trace f (setf f))))
