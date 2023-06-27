(cl:in-package #:iconoclast-builder-test)

(define-test defun)

(define-test defun-empty
  :parent defun
  (compare-parse-and-unparse '(defun f ())))

(define-test defun-one-required
  :parent defun
  (compare-parse-and-unparse '(defun f (x))))

(define-test defun-one-optional-empty
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&optional))))

(define-test defun-one-optional-symbol
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&optional x))))

(define-test defun-optional-list
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&optional (x)))))

(define-test defun-optional-initform
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&optional (x 234)))))

(define-test defun-optional-supplied-p
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&optional (x 234 y)))))

(define-test defun-rest
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&rest x))))

(define-test defun-key-empty
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key))))

(define-test defun-key-symbol
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key x))))

(define-test defun-key-list
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key (x)))))

(define-test defun-key-initform
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key (x 234)))))

(define-test defun-key-supplied-p
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key (x 234 y)))))

(define-test defun-key-keyword
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key ((:x x) 234 y)))))

(define-test defun-key-allow-other-keys
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&key ((:x x) 234 y) &allow-other-keys))))

(define-test defun-aux-empty
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&aux))))

(define-test defun-aux-symbol
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&aux x))))

(define-test defun-aux-list
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&aux (x)))))

(define-test defun-aux-initform
  :parent defun
  (compare-parse-and-unparse
   '(defun f (&aux (x 234)))))

(define-test defun-aux-with-declaration
  :parent defun
  (compare-parse-and-unparse
   '(defun f (x) (declare (inline f)))))

(define-test defun-aux-with-documentation
  :parent defun
  (compare-parse-and-unparse
   '(defun f (x) "hello" y)))
