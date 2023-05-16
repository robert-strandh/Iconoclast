(cl:in-package #:iconoclast-builder-test)

(defun test-throw-1 ()
  (run-test
   '(throw 234 345)
   '(ico:throw-ast
     ("result-form-ast" (ico:unparsed-form-ast :form 345))
     ("tag-ast" (ico:unparsed-form-ast :form 234)))))

(defun test-throw ()
  (format *trace-output* "Testing THROW~%")
  (test-throw-1))
