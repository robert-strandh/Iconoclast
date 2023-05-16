(cl:in-package #:iconoclast-builder-test)

(defun test-progv-1 ()
  (run-test
   '(progv a b)
   '(ico:progv-ast
     ("form-asts" nil)
     ("symbols-ast"
      (ico:unparsed-form-ast :form a))
     ("values-ast"
      (ico:unparsed-form-ast :form b)))))

(defun test-progv ()
  (format *trace-output* "Testing PROGV~%")
  (test-progv-1))
