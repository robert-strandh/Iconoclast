(cl:in-package #:iconoclast-builder-test)

(defun test-multiple-value-prog1-1 ()
  (let ((result (bld::test '(multiple-value-prog1 a))))
    (assert (equal (convert-ast result)
                   '(ico:multiple-value-prog1-ast
                     ("first-form-ast"
                      (bld:unparsed-form-ast :form a))
                     ("form-asts" nil))))))

(defun test-multiple-value-prog1 ()
  (format *trace-output* "Testing MULTIPLE-VALUE-PROG1~%")
  (test-multiple-value-prog1-1))
