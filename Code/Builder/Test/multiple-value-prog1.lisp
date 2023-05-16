(cl:in-package #:iconoclast-builder-test)

(defun test-multiple-value-prog1-1 ()
  (run-test
   '(multiple-value-prog1 a)
   '(ico:multiple-value-prog1-ast
     ("first-form-ast"
      (ico:unparsed-form-ast :form a))
     ("form-asts" nil))))

(defun test-multiple-value-prog1 ()
  (format *trace-output* "Testing MULTIPLE-VALUE-PROG1~%")
  (test-multiple-value-prog1-1))
