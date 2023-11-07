(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-application-lambda-to-labels--and-unparse (lambda-application)
  (parse-transform-and-unparse
   lambda-application #'iat:application-lambda-to-labels))

(define-test application-lambda-to-labels)

(define-test application-lambda-to-labels-no-parameters
  :parent application-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 ()))
        (#1#))
      (parse-application-lambda-to-labels--and-unparse
       '((lambda ())))))
