(cl:in-package #:iconoclast-builder-test)

(defun test-multiple-value-call-1 ()
  (run-test
   '(multiple-value-call a)
   '(ico:multiple-value-call-ast
     ("form-asts" nil)
     ("function-form-ast"
      (bld:unparsed-form-ast :form a)))))

(defun test-multiple-value-call ()
  (format *trace-output* "Testing MULTIPLE-VALUE-CALL~%")
  (test-multiple-value-call-1))
