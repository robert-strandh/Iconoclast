(cl:in-package #:iconoclast-builder)

(defun test (expression)
  (let ((builder (make-instance 'builder)))
    (ses:parse builder t expression)))

(defun test-list (expression)
  (let ((builder 'list))
    (ses:parse builder t expression)))
