(cl:in-package #:iconoclast-builder-test)

;;; Since the deftype lambda list is syntactically identical to the
;;; macro lambda list, we are going to assume that the same code is
;;; used to parse both.  Since the macro lambda list is tested
;;; elsewhere, we don't do it again here.

(define-test deftype)

(define-test deftype-empty
  :parent deftype
  (compare-parse-and-unparse '(deftype x ())))

(define-test deftype-one-required
  :parent deftype
  (compare-parse-and-unparse '(deftype x (y))))

(define-test deftype-with-declaration
  :parent deftype
  (compare-parse-and-unparse
   '(deftype x (y) (declare (inline f)))))

(define-test deftype-with-documentation
  :parent deftype
  (compare-parse-and-unparse
   '(deftype x (y) "doc" z)))

(define-test deftype-with-two-forms
  :parent deftype
  (compare-parse-and-unparse
   '(deftype x (y) z w)))
