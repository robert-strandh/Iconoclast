(cl:in-package #:iconoclast-builder-test)

(defun test-block-1 ()
  (run-test
   '(block hello)
   '(ico:block-ast
     ("form-asts" nil)
     ("name-ast"
      (ico:block-name-ast :name hello)))))

(defun test-block-2 ()
  (run-test
   '(block hello 234)
   '(ico:block-ast
     ("form-asts"
      ((bld:unparsed-form-ast :form 234)))
     ("name-ast" (ico:block-name-ast :name hello)))))

(defun test-block ()
  (format *trace-output* "Testing BLOCK~%")
  (test-block-1)
  (test-block-2))
