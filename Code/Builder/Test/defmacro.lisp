(cl:in-package #:iconoclast-builder-test)

(define-test defmacro)

(define-test defmacro-empty
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo ())))

(define-test defmacro-one-required
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (x))))

(define-test defmacro-one-required-pattern
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo ((x)))))

(define-test defmacro-optional-empty
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&optional))))

(define-test defmacro-one-optional-no-init-form-symbol
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&optional x))))

(define-test defmacro-one-optional-no-init-form-list
  :parent defmacro
  (is #'equal
      (parse-and-unparse '(defmacro foo (&optional (x))))
      '(defmacro foo (&optional x))))

(define-test defmacro-one-optional-init-form
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&optional (x y)))))

(define-test defmacro-one-optional-supplied-p
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&optional (x y z)))))

(define-test defmacro-two-optional
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&optional (x (y z))))))

(define-test defmacro-optional-pattern
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&optional ((&optional x))))))

(define-test defmacro-rest-symbol
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&rest x))))

(define-test defmacro-rest-pattern
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&rest (x &optional y)))))

(define-test defmacro-key-empty
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key))))

(define-test defmacro-one-key-symbol
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key x))))

(define-test defmacro-one-key-list
  :parent defmacro
  (is #'equal
      (parse-and-unparse '(defmacro foo (&key (x))))
      '(defmacro foo (&key x))))

(define-test defmacro-one-key-initform
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key (x y)))))

(define-test defmacro-one-key-supplied-p
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key (x y z)))))

(define-test defmacro-one-key-keyword
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key ((:x x) y z)))))

(define-test defmacro-one-key-pattern
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key ((:x (x &optional w)) y z)))))

(define-test defmacro-key-allow-other-keys
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&key x &allow-other-keys))))

(define-test defmacro-aux-empty
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&aux))))

(define-test defmacro-one-aux-symbol
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&aux x))))

(define-test defmacro-one-aux-list
  :parent defmacro
  (is #'equal
      (parse-and-unparse '(defmacro foo (&aux (x))))
      '(defmacro foo (&aux x))))

(define-test defmacro-one-aux-initarg
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&aux (x y)))))

(define-test defmacro-whole
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (&whole w x &optional y  &key))))

(define-test defmacro-whole-environment-first
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo
     (&whole w &environment env x &optional y  &key))))

(define-test defmacro-whole-environment-last
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo
     (&whole w x &optional y  &key &environment env))))

(define-test defmacro-declaration
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (x) (declare (inline f)))))

(define-test defmacro-documentation
  :parent defmacro
  (compare-parse-and-unparse
   '(defmacro foo (x) "doc" x)))
