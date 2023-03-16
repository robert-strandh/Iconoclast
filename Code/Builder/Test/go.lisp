(cl:in-package #:iconoclast-builder-test)

(defun test-go-1 ()
  (let ((result (bld::test '(go 234))))
    (assert (equal (convert-ast result)
                   '(ico:go-ast
                     ("tag-ast" (ico:tag-ast :name 234)))))))

(defun test-go ()
  (format *trace-output* "Testing GO~%")
  (test-go-1))
