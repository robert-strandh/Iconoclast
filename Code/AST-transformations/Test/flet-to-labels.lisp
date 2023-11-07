(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-flet-to-labels-and-unparse (flet)
  (parse-transform-and-unparse
   flet #'iat:flet-to-labels))

(define-test flet-to-labels)

(define-test flet-to-labels-one-function-no-parameters
  :parent flet-to-labels
  (is #'forms-similar-p
      '(labels ((f ())))
      (parse-flet-to-labels-and-unparse
       '(flet ((f ()))))))

(define-test flet-to-labels-one-function-one-parameter
  :parent flet-to-labels
  (is #'forms-similar-p
      '(labels ((f (x) x)))
      (parse-flet-to-labels-and-unparse
       '(flet ((f (x) x))))))

(define-test flet-to-labels-one-function-one-parameter-and-declaration
  :parent flet-to-labels
  (is #'forms-similar-p
      '(labels ((f (x) (declare (dynamic-extent x)) x)))
      (parse-flet-to-labels-and-unparse
       '(flet ((f (x) (declare (dynamic-extent x)) x))))))

(define-test flet-to-labels-two-functions
  :parent flet-to-labels
  (is #'forms-similar-p
      '(labels ((f ()) (g ())))
      (parse-flet-to-labels-and-unparse
       '(flet ((f ()) (g ()))))))
