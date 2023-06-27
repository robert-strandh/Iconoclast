(cl:in-package #:iconoclast-builder-test)

(define-test do-symbols)

(define-test do-symbols-empty
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x))))

(define-test do-symbols-package
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x y))))

(define-test do-symbols-result
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x y z))))

(define-test do-symbols-declaration
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x y z) (declare (inline f)))))

(define-test do-symbols-tag
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x y z) 234)))

(define-test do-symbols-statement
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x y z) (f x))))

(define-test do-symbols-tag-and-statement
  :parent do-symbols
  (compare-parse-and-unparse
   '(do-symbols (x y z) 234 (f x))))
