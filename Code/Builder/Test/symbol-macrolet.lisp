(cl:in-package #:iconoclast-builder-test)

(defun test-symbol-macrolet-1 ()
  (let ((result (bld::test '(symbol-macrolet ()))))
    (assert (equal (convert-ast result)
                   '(ico:symbol-macrolet-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("symbol-expansion-asts" nil))))))

(defun test-symbol-macrolet-2 ()
  (let ((result (bld::test '(symbol-macrolet ((f 234))))))
    (assert (equal (convert-ast result)
                   '(ico:symbol-macrolet-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("symbol-expansion-asts"
                      ((ico:symbol-expansion-ast
                        ("expansion-ast" (bld:unparsed-form-ast :form 234))
                        ("symbol-ast" (ico:variable-ast :name f))))))))))

(defun test-symbol-macrolet ()
  (format *trace-output* "Testing SYMBOL-MACROLET~%")
  (test-symbol-macrolet-1)
  (test-symbol-macrolet-2))
