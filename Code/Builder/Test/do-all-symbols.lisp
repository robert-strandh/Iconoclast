(cl:in-package #:iconoclast-builder-test)

(define-test do-all-symbols)

(define-test do-all-symbols-empty
  :parent do-all-symbols
  (compare-parse-and-unparse
   '(do-all-symbols (x))))

(define-test do-all-symbols-result
  :parent do-all-symbols
  (compare-parse-and-unparse
   '(do-all-symbols (x y))))

(define-test do-all-symbols-declaration
  :parent do-all-symbols
  (compare-parse-and-unparse
   '(do-all-symbols (x y) (declare (inline f)))))

(define-test do-all-symbols-tag
  :parent do-all-symbols
  (compare-parse-and-unparse
   '(do-all-symbols (x y) 234)))

(define-test do-all-symbols-statement
  :parent do-all-symbols
  (compare-parse-and-unparse
   '(do-all-symbols (x y) (f x))))

(define-test do-all-symbols-tag-and-statement
  :parent do-all-symbols
  (compare-parse-and-unparse
   '(do-all-symbols (x y) 234 (f x))))
