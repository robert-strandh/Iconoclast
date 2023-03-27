(cl:in-package #:iconoclast-builder-test)

(defun test-go-1 ()
  (run-test
   '(go 234)
   '(ico:go-ast
     ("tag-ast" (ico:tag-ast :name 234)))))

(defun test-go ()
  (format *trace-output* "Testing GO~%")
  (test-go-1))
