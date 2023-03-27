(cl:in-package #:iconoclast-builder-test)

(defun test-catch-1 ()
  (run-test
   '(catch 234)
   '(ico:catch-ast
     ("form-asts" nil)
     ("tag-ast" (bld:unparsed-form-ast :form 234)))))

(defun test-catch ()
  (format *trace-output* "Testing CATCH~%")
  (test-catch-1))
