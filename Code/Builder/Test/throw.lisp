(cl:in-package #:iconoclast-builder-test)

(defun test-throw-1 ()
  (let ((result (bld::test '(throw 234 345))))
    (assert (equal (convert-ast result)
                   '(ico:throw-ast
                     ("result-form-ast" (bld:unparsed-form-ast :form 345))
                     ("tag-ast" (bld:unparsed-form-ast :form 234)))))))

(defun test-throw ()
  (format *trace-output* "Testing THROW~%")
  (test-throw-1))
