(cl:in-package #:iconoclast-builder-test)

(defun parse-and-unparse (form)
  (let* ((builder (make-instance 'bld:builder))
         (syntax (ses:find-syntax (first form)))
         (ast (ses:parse builder syntax form)))
    (ses:unparse builder t ast)))

(defun compare-parse-and-unparse (form)
  (is #'equal form (parse-and-unparse form)))
