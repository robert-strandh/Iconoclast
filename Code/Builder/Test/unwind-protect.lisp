(cl:in-package #:iconoclast-builder-test)

(defun test-unwind-protect-1 ()
  (run-test
   '(unwind-protect 234)
   '(ico:unwind-protect-ast
     ("form-asts" nil)
     ("protected-form-ast"
      (ico:unparsed-form-ast :form 234)))))

(defun test-unwind-protect ()
  (format *trace-output* "Testing UNWIND-PROTECT~%")
  (test-unwind-protect-1))
