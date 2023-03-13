(cl:in-package #:iconoclast-builder)

(defun test (expression)
  (let ((builder (make-instance 'builder)))
    (s-expression-syntax:parse builder t expression)))
