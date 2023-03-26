(cl:in-package #:iconoclast-builder-test)

(defun test-multiple-value-bind-1 ()
  (run-test
   '(multiple-value-bind () (f x))
   '(ico:multiple-value-bind-ast
     ("declaration-asts" nil)
     ("form-ast" (bld:unparsed-form-ast :form (f x)))
     ("form-asts" nil)
     ("variable-name-asts" nil))))

(defun test-multiple-value-bind-2 ()
  (run-test
   '(multiple-value-bind (x y) (f x))
   '(ico:multiple-value-bind-ast
     ("declaration-asts" nil)
     ("form-ast" (bld:unparsed-form-ast :form (f x)))
     ("form-asts" nil)
     ("variable-name-asts"
      ((ico:variable-name-ast :name x)
       (ico:variable-name-ast :name y))))))

(defun test-multiple-value-bind ()
  (format *trace-output* "Testing MULTIPLE-VALUE-BIND~%")
  (test-multiple-value-bind-1)
  (test-multiple-value-bind-2))
