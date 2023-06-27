(cl:in-package #:iconoclast-builder-test)

;;; DEFINE-SETF-EXPANDER takes a macro lambda list, and we have
;;; tested the macro lambda list elsewhere, so we don't repeat
;;; those tests here.

(define-test define-setf-expander)

(define-test define-setf-expander-empty
  :parent define-setf-expander
  (compare-parse-and-unparse
   '(define-setf-expander f (x))))

(define-test define-setf-expander-declaration
  :parent define-setf-expander
  (compare-parse-and-unparse
   '(define-setf-expander f (x) (declare (inline f)))))

(define-test define-setf-expander-documentation
  :parent define-setf-expander
  (compare-parse-and-unparse
   '(define-setf-expander f (x) "doc" x)))

(define-test define-setf-expander-just-form
  :parent define-setf-expander
  (compare-parse-and-unparse
   '(define-setf-expander f (x) x)))
