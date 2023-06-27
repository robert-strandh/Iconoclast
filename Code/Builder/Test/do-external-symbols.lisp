(cl:in-package #:iconoclast-builder-test)

(define-test do-external-symbols)

(define-test do-external-symbols-empty
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x))))

(define-test do-external-symbols-package
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x y))))

(define-test do-external-symbols-result
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x y z))))

(define-test do-external-symbols-declaration
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x y z) (declare (inline f)))))

(define-test do-external-symbols-tag
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x y z) 234)))

(define-test do-external-symbols-statement
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x y z) (f x))))

(define-test do-external-symbols-tag-and-statement
  :parent do-external-symbols
  (compare-parse-and-unparse
   '(do-external-symbols (x y z) 234 (f x))))
