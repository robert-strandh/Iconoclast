(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-let*-to-labels-and-unparse (let)
  (parse-transform-and-unparse
   let #'iat:let*-to-labels))

(define-test let*-to-labels)

(define-test let*-to-labels-no-bindings
  :parent let*-to-labels
  (is #'forms-similar-p
      '(progn 234)
      (parse-let*-to-labels-and-unparse
       '(let* () 234))))

(define-test let*-to-labels-one-binding-no-initform
  :parent let*-to-labels
  (is #'forms-similar-p
      '(progn (labels ((#1=#:f (x) x)) (#1# nil)))
      (parse-let*-to-labels-and-unparse
       '(let* (x) x))))

(define-test let*-to-labels-one-binding-with-initform
  :parent let*-to-labels
  (is #'forms-similar-p
      '(progn (labels ((#1=#:f (x) x)) (#1# 234)))
      (parse-let*-to-labels-and-unparse
       '(let* ((x 234)) x))))

(define-test let*-to-labels-two-bindings
  :parent let*-to-labels
  (is #'forms-similar-p
      '(progn
        (labels ((#1=#:f (x)
                   (labels ((#2=#:g (y)
                              x
                              y))
                     (#2# 345))))
          (#1# 234)))
      (parse-let*-to-labels-and-unparse
       '(let* ((x 234) (y 345)) x y))))
