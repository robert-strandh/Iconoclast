(cl:in-package #:iconoclast-builder-test)

(define-test locally)

(define-test locally-empty
  :parent locally
  (compare-parse-and-unparse '(locally)))

(define-test locally-no-declarations-simple-body
  :parent locally
  (compare-parse-and-unparse '(locally 234)))

(define-test locally-single-declaration-no-body
  :parent locally
  (compare-parse-and-unparse '(locally (declare (inline f)))))

(define-test locally-single-declaration-simple-body
  :parent locally
  (compare-parse-and-unparse '(locally (declare (inline f) 234))))
