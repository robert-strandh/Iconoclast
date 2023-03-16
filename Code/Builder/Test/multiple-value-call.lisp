(cl:in-package #:iconoclast-builder-test)

(defun test-multiple-value-call-1 ()
  (let ((result (bld::test '(multiple-value-call a))))
    (assert (equal (convert-ast result)
                   '(ico:multiple-value-call-ast
                     ("form-asts" nil)
                     ("function-form-ast"
                      (bld:unparsed-form-ast :form a)))))))

(defun test-multiple-value-call ()
  (format *trace-output* "Testing MULTIPLE-VALUE-CALL~%")
  (test-multiple-value-call-1))
