(cl:in-package #:iconoclast-builder-test)

(defun test-if-1 ()
  (run-test
   '(if 234 345 456)
   '(ico:if-ast
     ("else-ast" (bld:unparsed-form-ast :form 456))
     ("test-ast" (bld:unparsed-form-ast :form 234))
     ("then-ast" (bld:unparsed-form-ast :form 345)))))

(defun test-if ()
  (format *trace-output* "Testing IF~%")
  (test-if-1))
