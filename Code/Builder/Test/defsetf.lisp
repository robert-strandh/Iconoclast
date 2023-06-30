(cl:in-package #:iconoclast-builder-test)

(define-test defsetf)

(define-test defsetf-short-form-no-documentation
  :parent defsetf
  (compare-parse-and-unparse '(defsetf f g)))

(define-test defsetf-short-form-with-documentation
  :parent defsetf
  :depends-on (defsetf-short-form-no-documentation)
  (compare-parse-and-unparse '(defsetf f g "hello")))

(define-test defsetf-long-form-empty
  :parent defsetf
  (compare-parse-and-unparse '(defsetf f () ())))

(define-test defsetf-long-form-one-required
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse '(defsetf f (x) ())))

(define-test defsetf-long-form-optional-empty
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&optional) ())))

(define-test defsetf-long-form-optional-symbol
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&optional x) ())))

(define-test defsetf-long-form-optional-list
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&optional (x)) ())))

(define-test defsetf-long-form-optional-initform
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&optional (x 234)) ())))

(define-test defsetf-long-form-optional-supplied-p
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&optional x 234 y) ())))

(define-test defsetf-long-form-key-empty
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key) ())))

(define-test defsetf-long-form-key-symbol
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key x) ())))

(define-test defsetf-long-form-key-list
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key (x)) ())))

(define-test defsetf-long-form-key-initform
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key (x 234)) ())))

(define-test defsetf-long-form-key-supplied-p
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key (x 234 y)) ())))

(define-test defsetf-long-form-key-keyword
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key ((:x x) 234 y)) ())))

(define-test defsetf-long-form-key-allow-other-keys
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (&key ((:x x) 234 y) &allow-other-keys) ())))

(define-test defsetf-long-form-with-store-variables
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (x) (a b))))

(define-test defsetf-long-form-with-declaration
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (x) (a b) (declare (inline f)))))

(define-test defsetf-long-form-with-documentation
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (x) (a b) "hello" x)))

(define-test defsetf-long-form-with-two-forms
  :parent defsetf
  :depends-on (defsetf-long-form-empty)
  (compare-parse-and-unparse
   '(defsetf f (x) (a b) y z)))
