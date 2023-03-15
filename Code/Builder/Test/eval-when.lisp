(cl:in-package #:iconoclast-builder-test)

(defun test-eval-when-1 ()
  (let ((result (bld::test '(eval-when () 234))))
    (assert (equal (convert-ast result)
                   '(ico:eval-when-ast
                     ("form-asts" ((bld:unparsed-form-ast :form 234)))
                     ("situation-asts" nil))))))

(defun test-eval-when ()
  (test-eval-when-1))
