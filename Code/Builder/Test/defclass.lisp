(cl:in-package #:iconoclast-builder-test)

(define-test defclass)

(define-test defclass-empty
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ())))

(define-test defclass-one-superclass-no-slots
  :parent defclass
  (compare-parse-and-unparse '(defclass foo (bar) ())))

(define-test defclass-two-superclasses-no-slots
  :parent defclass
  (compare-parse-and-unparse '(defclass foo (bar baz) ())))

(define-test defclass-one-simple-slot
  :parent defclass
  (is #'equal
      (parse-and-unparse '(defclass foo () (s)))
      '(defclass foo () ((s)))))

(define-test defclass-one-slot-with-initform
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :initform i)))))

(define-test defclass-one-slot-with-initarg
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :initarg :i)))))

(define-test defclass-one-slot-with-reader
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :reader s)))))

(define-test defclass-one-slot-with-writer
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :writer (setf s))))))

(define-test defclass-one-slot-with-accessor
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :accessor s)))))

(define-test defclass-one-slot-with-allocation
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :allocation :class)))))

(define-test defclass-one-slot-with-type
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :type t)))))

(define-test defclass-one-slot-with-documentation
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s :documentation "doc")))))

(define-test defclass-two-slots
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () ((s1) (s2)))))

(define-test defclass-with-metaclass
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () () (:metaclass bar))))

(define-test defclass-with-documentation
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () () (:documentation "doc"))))

(define-test defclass-with-default-initargs
  :parent defclass
  (compare-parse-and-unparse '(defclass foo () () (:default-initargs :f g))))
