(cl:in-package #:iconoclast-builder-test)

(defun test-progn-1 ()
  (let ((result (bld::test '(progn))))
    (assert (equal (convert-ast result)
                   '(ico:progn-ast ("form-asts" nil))))))

(defun test-progn ()
  (format *trace-output* "Testing PROGN~%")
  (test-progn-1))
