(cl:in-package #:iconoclast-builder-test)

(defun test-progv-1 ()
  (let ((result (bld::test '(progv a b))))
    (assert (equal (convert-ast result)
                   '(ico:progv-ast
                     ("form-asts" nil)
                     ("symbols-ast"
                      (bld:unparsed-form-ast :form a))
                     ("values-ast"
                      (bld:unparsed-form-ast :form b)))))))

(defun test-progv ()
  (format *trace-output* "Testing PROGV~%")
  (test-progv-1))
