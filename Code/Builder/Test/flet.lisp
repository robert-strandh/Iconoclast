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

(defun test-labels-1 ()
  (let ((result (bld::test '(labels ()))))
    (assert (equal (convert-ast result)
                   '(ico:labels-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("lexical-function-asts" nil))))))

(defun test-labels-2 ()
  (let ((result (bld::test '(labels ((f ()))))))
    (assert (equal (convert-ast result)
                   '(ico:labels-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("lexical-function-asts"
                      (ico:lexical-function-ast
                       ("declaration-asts" nil)
                       ("documentation-ast" nil)
                       ("form-asts" nil)
                       ("name-ast"
                        (ico:function-name-ast :name f)))))))))

(defun test-labels ()
  (format *trace-output* "Testing LABELS~%")
  (test-labels-1)
  (test-labels-2))
