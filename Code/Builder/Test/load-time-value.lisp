(cl:in-package #:iconoclast-builder-test)

(defun test-load-time-value-1 ()
  (run-test
   '(load-time-value 234)
   '(ico:load-time-value-ast
     ("form-ast" (bld:unparsed-form-ast :form 234))
     ("read-only-p-ast" nil))))

(defun test-load-time-value ()
  (format *trace-output* "Testing LOAD-TIME-VALUE~%")
  (test-load-time-value-1))
