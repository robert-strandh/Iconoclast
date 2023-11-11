(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-application-lambda-to-labels-and-unparse (lambda-application)
  (parse-transform-and-unparse
   lambda-application #'iat:application-lambda-to-labels))

(define-test application-lambda-to-labels)

(define-test application-lambda-to-labels-no-parameters
  :parent application-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 ()))
        (#1#))
      (parse-application-lambda-to-labels-and-unparse
       '((lambda ())))))

(define-test application-lambda-to-labels-one-parameter
  :parent application-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 (x) x))
        (#1# 234))
      (parse-application-lambda-to-labels-and-unparse
       '((lambda (x) x) 234))))

(define-test application-lambda-to-labels-one-parameter-and-declaration
  :parent application-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 (x) (declare (dynamic-extent x)) x))
        (#1# 234))
      (parse-application-lambda-to-labels-and-unparse
       '((lambda (x) (declare (dynamic-extent x)) x) 234))))
