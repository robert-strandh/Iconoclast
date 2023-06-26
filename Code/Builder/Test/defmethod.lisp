(cl:in-package #:iconoclast-builder-test)

(define-test defmethod)

(define-test defmethod-empty
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo ())))

(define-test defmethod-one-required-unspecialized
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x))))

(define-test defmethod-one-required-specialized
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo ((x y)))))

(define-test defmethod-optional-empty
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &optional))))

(define-test defmethod-optional-symbol
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &optional y))))

(define-test defmethod-optional-list
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &optional (y)))))

(define-test defmethod-optional-initform
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &optional (y 10)))))

(define-test defmethod-optional-supplied-p
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &optional (y 10 z)))))

(define-test defmethod-rest
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &rest y))))

(define-test defmethod-key-empty
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key))))

(define-test defmethod-key-symbol
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key y))))

(define-test defmethod-key-list
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key (y)))))

(define-test defmethod-key-initarg
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key (y 10)))))

(define-test defmethod-key-supplied-p
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key (y 10 z)))))

(define-test defmethod-key-keyword
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key ((:y y) 10 z)))))

(define-test defmethod-key-allow-other-keys
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &key ((:y y) 10 z) &allow-other-keys))))

(define-test defmethod-aux-empty
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &aux))))

(define-test defmethod-aux-symbol
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &aux y))))

(define-test defmethod-aux-list
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &aux (y)))))

(define-test defmethod-aux-initform
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x &aux (y z)))))

(define-test defmethod-method-qualifiers
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo a b c (x))))

(define-test defmethod-declaration
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x) (declare (inline f)))))

(define-test defmethod-documentation
  :parent defmethod
  (compare-parse-and-unparse
   '(defmethod foo (x) "doc" y)))
