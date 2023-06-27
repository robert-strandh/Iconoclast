(cl:in-package #:iconoclast-builder-test)

(define-test dolist)

(define-test dolist-empty
  :parent dolist
  (compare-parse-and-unparse
   '(dolist (w x))))

(define-test dolist-result
  :parent dolist
  (compare-parse-and-unparse
   '(dolist (w x y))))

(define-test dolist-declaration
  :parent dolist
  (compare-parse-and-unparse
   '(dolist (w x y) (declare (inline f)))))

(define-test dolist-tag
  :parent dolist
  (compare-parse-and-unparse
   '(dolist (w x y) 234)))

(define-test dolist-statement
  :parent dolist
  (compare-parse-and-unparse
   '(dolist (w x y) (f x))))

(define-test dolist-tag-and-statement
  :parent dolist
  (compare-parse-and-unparse
   '(dolist (w x y) 234 (f x))))
