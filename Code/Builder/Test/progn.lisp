(cl:in-package #:iconoclast-builder-test)

(defun test-progn-1 ()
  (run-test
   '(progn)
   '(ico:progn-ast ("form-asts" nil))))

(defun test-progn ()
  (format *trace-output* "Testing PROGN~%")
  (test-progn-1))
