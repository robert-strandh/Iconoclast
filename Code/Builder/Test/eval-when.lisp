(cl:in-package #:iconoclast-builder-test)

(define-test eval-when)

(define-test eval-when-no-situations-no-body
  :parent eval-when
  (compare-parse-and-unparse '(eval-when ())))

(define-test eval-when-no-situations-simple-body
  :parent eval-when
  :depends-on (eval-when-no-situations-no-body)
  (compare-parse-and-unparse '(eval-when () 234)))

(define-test eval-when-compile-toplevel-no-body
  :parent eval-when
  :depends-on (eval-when-no-situations-no-body)
  (compare-parse-and-unparse
   '(eval-when (:compile-toplevel))))

(define-test eval-when-load-toplevel-no-body
  :parent eval-when
  :depends-on (eval-when-no-situations-no-body)
  (compare-parse-and-unparse
   '(eval-when (:load-toplevel))))

(define-test eval-when-execute-no-body
  :parent eval-when
  :depends-on (eval-when-no-situations-no-body)
  (compare-parse-and-unparse
   '(eval-when (:execute))))
