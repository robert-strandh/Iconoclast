(cl:in-package #:iconoclast-builder-test)

(defun test-flet-1 ()
  (run-test
   '(flet ())
   '(ico:flet-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("binding-asts" nil))))

(defun test-flet-2 ()
  (run-test
   '(flet ((f ())))
   '(ico:flet-ast
     ("declaration-asts" nil) ("form-asts" nil)
     ("binding-asts"
      ((ico:lexical-function-ast ("declaration-asts" nil)
        ("documentation-ast" nil)
        ("form-asts" nil)
        ("lambda-list-ast"
         (ico:ordinary-lambda-list-ast
          ("aux-parameter-asts" nil)
          ("key-parameter-asts" nil)
          ("optional-parameter-asts" nil)
          ("required-parameter-asts" nil)
          ("rest-parameter-ast" nil)))
        ("name-ast" (ico:function-name-ast :name f))))))))

(defun test-flet ()
  (format *trace-output* "Testing FLET~%")
  (test-flet-1)
  (test-flet-2))

(defun test-labels-1 ()
  (run-test
   '(labels ())
   '(ico:labels-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("binding-asts" nil))))

(defun test-labels-2 ()
  (run-test
   '(labels ((f ())))
   '(ico:labels-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("binding-asts"
      ((ico:lexical-function-ast
        ("declaration-asts" nil)
        ("documentation-ast" nil) ("form-asts" nil)
        ("lambda-list-ast"
         (ico:ordinary-lambda-list-ast
          ("aux-parameter-asts" nil)
          ("key-parameter-asts" nil)
          ("optional-parameter-asts" nil)
          ("required-parameter-asts" nil)
          ("rest-parameter-ast" nil)))
        ("name-ast" (ico:function-name-ast :name f))))))))

(defun test-labels ()
  (format *trace-output* "Testing LABELS~%")
  (test-labels-1)
  (test-labels-2))

(defun test-macrolet-1 ()
  (run-test
   '(macrolet ())
   '(ico:macrolet-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("binding-asts" nil))))

(defun test-macrolet-2 ()
  (run-test
   '(macrolet ((f ())))
   '(ico:macrolet-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("binding-asts"
      ((ico:lexical-function-ast
        ("declaration-asts" nil)
        ("documentation-ast" nil) ("form-asts" nil)
        ("lambda-list-ast" (ico:lambda-list-ast))
        ("name-ast" (ico:function-name-ast :name f))))))))

(defun test-macrolet ()
  (format *trace-output* "Testing MACROLET~%")
  (test-macrolet-1)
  (test-macrolet-2))
