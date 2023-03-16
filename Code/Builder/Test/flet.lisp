(cl:in-package #:iconoclast-builder-test)

(defun test-flet-1 ()
  (let ((result (bld::test '(flet ()))))
    (assert (equal (convert-ast result)
                   '(ico:flet-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("lexical-function-asts" nil))))))

(defun test-flet ()
  (format *trace-output* "Testing FLET~%")
  (test-flet-1))
