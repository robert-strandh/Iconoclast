(cl:in-package #:iconoclast-builder-test)

(define-test symbol-macrolet)

(define-test symbol-macrolet-no-definitions
  :parent symbol-macrolet
  (compare-parse-and-unparse '(symbol-macrolet ())))

(define-test symbol-macrolet-one-definition
  :parent symbol-macrolet
  (compare-parse-and-unparse '(symbol-macrolet ((f 234)))))
