(cl:in-package #:iconoclast-builder-test)

(define-test pushnew)

(define-test pushnew-no-keys
  :parent pushnew
  (compare-parse-and-unparse
   '(pushnew a b)))

(define-test pushnew-key
  :parent pushnew
  (compare-parse-and-unparse
   '(pushnew a b :key x)))

(define-test pushnew-test
  :parent pushnew
  (compare-parse-and-unparse
   '(pushnew a b :test x)))

(define-test pushnew-test-not
  :parent pushnew
  (compare-parse-and-unparse
   '(pushnew a b :test-not)))

(define-test pushnew-multiple-keys
  :parent pushnew
  (compare-parse-and-unparse
   '(pushnew a b :key x :test y :key z)))
