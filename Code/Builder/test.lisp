(cl:in-package #:iconoclast-builder)

(defun test (expression)
  (let ((builder (make-instance 'builder)))
    (s-expression-syntax:parse builder t expression)))

(defun test-list (expression)
  (let ((builder 'list))
    (s-expression-syntax:parse builder t expression)))
