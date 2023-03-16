(cl:in-package #:iconoclast-builder-test)

(defun test-catch-1 ()
  (let ((result (bld::test '(catch 234))))
    (assert (equal (convert-ast result)
                   '(ico:catch-ast
                     ("form-asts" nil)
                     ("tag-ast" (bld:unparsed-form-ast :form 234)))))))

(defun test-catch ()
  (format *trace-output* "Testing CATCH~%")
  (test-catch-1))
