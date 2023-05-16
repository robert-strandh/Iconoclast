(cl:in-package #:iconoclast-builder-test)

(defun test-eval-when-1 ()
  (run-test
   '(eval-when () 234)
   '(ico:eval-when-ast
     ("form-asts" ((ico:unparsed-form-ast :form 234)))
     ("situation-asts" nil))))

(defun test-eval-when-2 ()
  (run-test
   '(eval-when (:compile-toplevel) 234)
   '(ico:eval-when-ast
     ("form-asts" ((ico:unparsed-form-ast :form 234)))
     ("situation-asts"
      ((ico:situation-ast :name :compile-toplevel))))))

(defun test-eval-when ()
  (format *trace-output* "Testing EVAL-WHEN~%")
  (test-eval-when-1)
  (test-eval-when-2))
