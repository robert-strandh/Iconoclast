(cl:in-package #:iconoclast-builder-test)

(defun test-let-1 ()
  (let ((result (bld::test '(let ()))))
    (assert (equal (convert-ast result)
                   '(ico:let-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("variable-binding-asts" nil))))))

(defun test-let-2 ()
  (let ((result (bld::test '(let (x)))))
    (assert (equal (convert-ast result)
                   '(ico:let-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("variable-binding-asts"
                      ((ico:variable-binding-ast ("form-ast" nil)
                        ("variable-name-ast" (ico:variable-name-ast :name x))))))))))

(defun test-let ()
  (format *trace-output* "Testing LET~%")
  (test-let-1)
  (test-let-2))
