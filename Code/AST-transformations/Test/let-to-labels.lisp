(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-let-to-labels-and-unparse (let)
  (parse-transform-and-unparse
   let #'iat:let-to-labels))

(define-test let-to-labels)

(define-test let-to-labels-no-bindings
  :parent let-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:f () 234)) (#1#))
      (parse-let-to-labels-and-unparse
       '(let () 234))))
