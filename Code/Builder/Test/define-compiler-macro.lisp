(cl:in-package #:iconoclast-builder-test)

(define-test define-compiler-macro)

(define-test define-compiler-macro-empty
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo ())))

(define-test define-compiler-macro-one-required
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (x))))

(define-test define-compiler-macro-one-required-pattern
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo ((x)))))

(define-test define-compiler-macro-optional-empty
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional))))

(define-test define-compiler-macro-one-optional-no-init-form-symbol
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional x))))

(define-test define-compiler-macro-one-optional-no-init-form-list
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional (x)))))

(define-test define-compiler-macro-one-optional-init-form
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional (x y)))))

(define-test define-compiler-macro-one-optional-supplied-p
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional (x y z)))))

(define-test define-compiler-macro-two-optional
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional (x (y z))))))

(define-test define-compiler-macro-optional-pattern
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&optional ((&optional x))))))

(define-test define-compiler-macro-rest-symbol
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&rest x))))

(define-test define-compiler-macro-rest-pattern
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&rest (x &optional y)))))

(define-test define-compiler-macro-key-empty
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key))))

(define-test define-compiler-macro-one-key-symbol
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key x))))

(define-test define-compiler-macro-one-key-list
  :parent define-compiler-macro
  (is #'equal
      (parse-and-unparse '(define-compiler-macro foo (&key (x))))
      '(define-compiler-macro foo (&key x))))

(define-test define-compiler-macro-one-key-initform
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key (x y)))))

(define-test define-compiler-macro-one-key-supplied-p
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key (x y z)))))

(define-test define-compiler-macro-one-key-keyword
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key ((:x x) y z)))))

(define-test define-compiler-macro-one-key-pattern
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key ((:x (x &optional w)) y z)))))

(define-test define-compiler-macro-key-allow-other-keys
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&key x &allow-other-keys))))

(define-test define-compiler-macro-aux-empty
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&aux))))

(define-test define-compiler-macro-one-aux-symbol
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&aux x))))

(define-test define-compiler-macro-one-aux-list
  :parent define-compiler-macro
  (is #'equal
      (parse-and-unparse '(define-compiler-macro foo (&aux (x))))
      '(define-compiler-macro foo (&aux x))))

(define-test define-compiler-macro-one-aux-initarg
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&aux (x y)))))

(define-test define-compiler-macro-whole
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (&whole w x &optional y  &key))))

(define-test define-compiler-macro-whole-environment-first
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo
     (&whole w &environment env x &optional y  &key))))

(define-test define-compiler-macro-whole-environment-last
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo
     (&whole w x &optional y  &key &environment env))))

(define-test define-compiler-macro-declaration
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (x) (declare (inline f)))))

(define-test define-compiler-macro-documentation
  :parent define-compiler-macro
  (compare-parse-and-unparse
   '(define-compiler-macro foo (x) "doc" x)))
