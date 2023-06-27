(cl:in-package #:iconoclast-builder-test)

(define-test destructuring-bind)

(define-test destructuring-bind-empty
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind ())))

(define-test destructuring-bind-one-required
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (x))))

(define-test destructuring-bind-one-required-pattern
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind ((x)))))

(define-test destructuring-bind-optional-empty
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional))))

(define-test destructuring-bind-one-optional-no-init-form-symbol
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional x))))

(define-test destructuring-bind-one-optional-no-init-form-list
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional (x)))))

(define-test destructuring-bind-one-optional-init-form
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional (x y)))))

(define-test destructuring-bind-one-optional-supplied-p
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional (x y z)))))

(define-test destructuring-bind-two-optional
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional (x (y z))))))

(define-test destructuring-bind-optional-pattern
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&optional ((&optional x))))))

(define-test destructuring-bind-rest-symbol
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&rest x))))

(define-test destructuring-bind-rest-pattern
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&rest (x &optional y)))))

(define-test destructuring-bind-key-empty
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key))))

(define-test destructuring-bind-one-key-symbol
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key x))))

(define-test destructuring-bind-one-key-list
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key (x)))))

(define-test destructuring-bind-one-key-initform
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key (x y)))))

(define-test destructuring-bind-one-key-supplied-p
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key (x y z)))))

(define-test destructuring-bind-one-key-keyword
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key ((:x x) y z)))))

(define-test destructuring-bind-one-key-pattern
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key ((:x (x &optional w)) y z)))))

(define-test destructuring-bind-key-allow-other-keys
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&key x &allow-other-keys))))

(define-test destructuring-bind-aux-empty
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&aux))))

(define-test destructuring-bind-one-aux-symbol
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&aux x))))

(define-test destructuring-bind-one-aux-list
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&aux (x)))))

(define-test destructuring-bind-one-aux-initarg
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&aux (x y)))))

(define-test destructuring-bind-whole
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (&whole w x &optional y  &key))))

(define-test destructuring-bind-declaration
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (x) (declare (inline f)))))

(define-test destructuring-bind-documentation
  :parent destructuring-bind
  (compare-parse-and-unparse
   '(destructuring-bind (x) "doc" x)))
