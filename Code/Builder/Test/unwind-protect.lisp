(cl:in-package #:iconoclast-builder-test)

(defun test-unwind-protect-1 ()
  (let ((result (bld::test '(unwind-protect 234))))
    (assert (equal (convert-ast result)
                   '(ico:unwind-protect-ast
                     ("form-asts" nil)
                     ("protected-form-ast"
                      (bld:unparsed-form-ast :form 234)))))))

(defun test-unwind-protect ()
  (format *trace-output* "Testing UNWIND-PROTECT~%")
  (test-unwind-protect-1))
