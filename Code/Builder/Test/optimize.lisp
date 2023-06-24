(cl:in-package #:iconoclast-builder-test)

(define-test optimize)

(define-test optimize-1
  :parent optimize
  (compare-parse-and-unparse '(locally (declare (optimize)))))

(define-test optimize-2
  :parent optimize
  (compare-parse-and-unparse '(locally (declare (optimize speed)))))

(define-test optimize-3
  :parent optimize
  (compare-parse-and-unparse '(locally (declare (optimize (speed 1))))))

(define-test optimize-4
  :parent optimize
  (compare-parse-and-unparse
   '(locally (declare (optimize (speed 1) (safety 0))))))
