(cl:in-package #:iconoclast-builder-test)

(define-test declaration-specifiers)

(define-test dynamic-extent
  :parent declaration-specifiers)

(define-test dynamic-extent-empty
  :parent dynamic-extent
  (compare-parse-and-unparse '(locally (declare (dynamic-extent)))))

(define-test dynamic-extent-one-variable
  :parent dynamic-extent
  (compare-parse-and-unparse '(locally (declare (dynamic-extent a)))))

(define-test dynamic-extent-two-variables
  :parent dynamic-extent
  (compare-parse-and-unparse '(locally (declare (dynamic-extent a b)))))

(define-test test-dynamic-extent-one-variable-one-function
  :parent dynamic-extent
  (compare-parse-and-unparse
   '(locally (declare (dynamic-extent a (function b))))))

(define-test inline
  :parent declaration-specifiers)

(define-test inline-1
  :parent inline
  (compare-parse-and-unparse '(locally (declare (inline)))))

(define-test inline-2
  :parent inline
  (compare-parse-and-unparse '(locally (declare (inline a)))))

(define-test inline-3
  :parent inline
  (compare-parse-and-unparse '(locally (declare (inline a b)))))

(define-test notinline)

(define-test notinline-1
  :parent notinline
  (compare-parse-and-unparse '(locally (declare (notinline)))))

(define-test notinline-2
  :parent notinline
  (compare-parse-and-unparse '(locally (declare (notinline a)))))

(define-test notinline-3
  :parent notinline
  (compare-parse-and-unparse '(locally (declare (notinline a b)))))

(define-test ignore)

(define-test ignore-1
  :parent ignore
  (compare-parse-and-unparse '(locally (declare (ignore)))))

(define-test ignore-2
  :parent ignore
  (compare-parse-and-unparse '(locally (declare (ignore a)))))

(define-test ignore-3
  :parent ignore
  (compare-parse-and-unparse '(locally (declare (ignore a b)))))

(define-test ignore-4
  :parent ignore
  (compare-parse-and-unparse
   '(locally (declare (ignore a (function b))))))

(define-test ignorable)

(define-test ignorable-1
  :parent ignorable
  (compare-parse-and-unparse '(locally (declare (ignorable)))))

(define-test ignorable-2
  :parent ignorable
  (compare-parse-and-unparse '(locally (declare (ignorable a)))))

(define-test ignorable-3
  :parent ignorable
  (compare-parse-and-unparse '(locally (declare (ignorable a b)))))

(define-test ignorable-4
  :parent ignorable
  (compare-parse-and-unparse
   '(locally (declare (ignorable a (function b))))))

(define-test special)

(define-test special-1
  :parent special
  (compare-parse-and-unparse '(locally (declare (special)))))

(define-test special-2
  :parent special
  (compare-parse-and-unparse '(locally (declare (special a)))))

(define-test special-3
  :parent special
  (compare-parse-and-unparse '(locally (declare (special a b)))))
