(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-function-lambda-to-labels--and-unparse (function-lambda)
  (parse-transform-and-unparse
   function-lambda #'iat:function-lambda-to-labels-everywhere))

(define-test function-lambda-to-labels)

(define-test function-lambda-to-labels-no-parameters
  :parent function-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 ()))
        (function #1#))
      (parse-function-lambda-to-labels--and-unparse
       '(function (lambda ())))))

(define-test function-lambda-to-labels-one-parameter
  :parent function-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 (x) x))
        (function #1#))
      (parse-function-lambda-to-labels--and-unparse
       '(function (lambda (x) x)))))

(define-test function-lambda-to-labels-one-parameter-and-declaration
  :parent function-lambda-to-labels
  (is #'forms-similar-p
      '(labels ((#1=#:G1229 (x) (declare (dynamic-extent x)) x))
        (function #1#))
      (parse-function-lambda-to-labels--and-unparse
       '(function (lambda (x) (declare (dynamic-extent x)) x)))))
