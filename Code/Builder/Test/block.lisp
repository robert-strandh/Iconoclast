(cl:in-package #:iconoclast-builder-test)

(defun test-block-1 ()
  (let ((result (bld::test '(block hello))))
    (assert (equal (convert-ast result)
                   '(ico:block-ast
                     ("form-asts" nil)
                     ("name-ast"
                      (ico:block-name-ast :name hello)))))))

(defun test-block-2 ()
  (let ((result (bld::test '(block hello 234))))
    (assert (equal (convert-ast result)
                   '(ico:block-ast
                     ("form-asts"
                      ((bld:unparsed-form-ast :form 234)))
                     ("name-ast" (ico:block-name-ast :name hello)))))))

(defun test-block ()
  (test-block-1)
  (test-block-2))
