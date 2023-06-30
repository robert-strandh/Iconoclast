(cl:in-package #:iconoclast-builder-test)

(define-test defgeneric)

(define-test defgeneric-empty-lambda-list
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo ())))

(define-test defgeneric-one-required
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (x))))

(define-test defgeneric-two-required
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (x y))))

(define-test defgeneric-optional-empty
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&optional))))

(define-test defgeneric-one-optional-symbol
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&optional x))))

(define-test defgeneric-one-optional-list
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&optional (x)))))

(define-test defgeneric-two-optionals
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&optional (x) y))))

(define-test defgeneric-rest
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&rest x))))

(define-test defgeneric-key-empty
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&key))))

(define-test defgeneric-one-key-symbol
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&key x))))

(define-test defgeneric-one-key-list
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&key (x)))))

(define-test defgeneric-one-key-with-keyword
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&key ((:x x))))))

(define-test defgeneric-two-keys
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&key x y))))

(define-test defgeneric-key-with-allow-other-keys
  :parent defgeneric
  (compare-parse-and-unparse '(defgeneric foo (&key x &allow-other-keys))))

(define-test defgeneric-with-argument-precedence-order
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo (x y) (:argument-precedence-order y x))))

(define-test defgeneric-with-declarations
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo (x y) (declare (inline f)))))

(define-test defgeneric-with-documentation
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo (x y) (:documentation "hello"))))

(define-test defgeneric-with-method-combination-no-arguments
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo (x y) (:method-combination foo))))

(define-test defgeneric-with-method-combination-one-arguments
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo (x y) (:method-combination foo bar))))

(define-test defgeneric-with-generic-function-class
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo (x y) (:generic-function-class foo))))

(define-test defgeneric-with-method-class
  :parent defgeneric
  (compare-parse-and-unparse
   '(defgeneric foo () (:method-class foo))))
