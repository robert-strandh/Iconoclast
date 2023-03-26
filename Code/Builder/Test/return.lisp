(cl:in-package #:iconoclast-builder-test)

(defun test-return-1 ()
  (run-test
   '(return)
   '(ico:return-ast ("form-ast" nil))))

(defun test-return-2 ()
  '(return 234)
  '(ico:return-ast ("form-ast" (bld:unparsed-form-ast :form 234))))

(defun test-return ()
  (format *trace-output* "Testing RETURN~%")
  (test-return-1)
  (test-return-2))
