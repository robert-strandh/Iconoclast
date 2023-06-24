(cl:in-package #:iconoclast-builder-test)

(defun parse-and-unparse (form)
  (let* ((builder (make-instance 'bld:builder))
         (ast (ses:parse builder t form)))
    (ses:unparse builder t ast)))

(defun compare-parse-and-unparse (form)
  (is #'equal form (parse-and-unparse form)))
