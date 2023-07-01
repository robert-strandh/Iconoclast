(cl:in-package #:iconoclast-builder-test)

(define-test define-condition)

(define-test define-condition-empty
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ())))

(define-test define-condition-one-superclass-no-slots
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo (bar) ())))

(define-test define-condition-two-superclasses-no-slots
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo (bar baz) ())))

(define-test define-condition-one-simple-slot
  :parent define-condition
  (is #'equal
      (parse-and-unparse '(define-condition foo () (s)))
      '(define-condition foo () ((s)))))

(define-test define-condition-one-slot-with-initform
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :initform i)))))

(define-test define-condition-one-slot-with-initarg
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :initarg :i)))))

(define-test define-condition-one-slot-with-reader
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :reader s)))))

(define-test define-condition-one-slot-with-writer
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :writer (setf s))))))

(define-test define-condition-one-slot-with-accessor
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :accessor s)))))

(define-test define-condition-one-slot-with-allocation
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :allocation :class)))))

(define-test define-condition-one-slot-with-type
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :type t)))))

(define-test define-condition-one-slot-with-documentation
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s :documentation "doc")))))

(define-test define-condition-two-slots
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () ((s1) (s2)))))

(define-test define-condition-with-documentation
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () () (:documentation "doc"))))

(define-test define-condition-with-default-initargs
  :parent define-condition
  (compare-parse-and-unparse '(define-condition foo () () (:default-initargs :f g))))

(define-test define-condition-with-report-string
  :parent define-condition
  (compare-parse-and-unparse
   '(define-condition foo () () (:report "hello"))))

(define-test define-condition-with-report-symbol
  :parent define-condition
  (compare-parse-and-unparse
   '(define-condition foo () () (:report f))))

(define-test define-condition-with-report-lambda
  :parent define-condition
  (compare-parse-and-unparse
   '(define-condition foo () () (:report (lambda (c s))))))
