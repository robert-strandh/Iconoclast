(cl:in-package #:iconoclast-builder-test)

(defun test-load-time-value-1 ()
  (let ((result (bld::test '(load-time-value 234))))
    (assert (equal (convert-ast result)
                   '(ico:load-time-value-ast
                     ("form-ast" (bld:unparsed-form-ast :form 234))
                     ("read-only-p-ast" nil))))))

(defun test-load-time-value ()
  (format *trace-output* "Testing LOAD-TIME-VALUE~%")
  (test-load-time-value-1))
