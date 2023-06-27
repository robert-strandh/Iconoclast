(cl:in-package #:iconoclast-builder-test)

(define-test in-package)

(define-test in-package-string
  :parent in-package
  (compare-parse-and-unparse
   '(in-package "hello")))

(define-test in-package-symbol
  :parent in-package
  (compare-parse-and-unparse
   '(in-package hello)))

(define-test in-package-character
  :parent in-package
  (compare-parse-and-unparse
   '(in-package #\a)))
