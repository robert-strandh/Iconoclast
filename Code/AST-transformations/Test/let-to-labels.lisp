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

(define-test let-to-labels-one-binding-no-initform
  :parent let-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:f (x) x)) (#1# nil))
      (parse-let-to-labels-and-unparse
       '(let (x) x))))

(define-test let-to-labels-one-binding-with-initform
  :parent let-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:f (x) x)) (#1# 234))
      (parse-let-to-labels-and-unparse
       '(let ((x 234)) x))))

(define-test let-to-labels-two-bindings
  :parent let-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:f (x y) x y)) (#1# 234 345))
      (parse-let-to-labels-and-unparse
       '(let ((x 234) (y 345)) x y))))
