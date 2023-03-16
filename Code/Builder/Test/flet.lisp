(cl:in-package #:iconoclast-builder-test)

(defun test-flet-1 ()
  (let ((result (bld::test '(flet ()))))
    (assert (equal (convert-ast result)
                   '(ico:flet-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("lexical-function-asts" nil))))))

(defun test-flet-2 ()
  (let ((result (bld::test '(flet ((f ()))))))
    (assert (equal (convert-ast result)
                   '(ico:flet-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("lexical-function-asts"
                      (ico:lexical-function-ast
                       ("declaration-asts" nil)
                       ("documentation-ast" nil)
                       ("form-asts" nil)
                       ("name-ast"
                        (ico:function-name-ast :name f)))))))))

(defun test-flet ()
  (format *trace-output* "Testing FLET~%")
  (test-flet-1)
  (test-flet-2))
