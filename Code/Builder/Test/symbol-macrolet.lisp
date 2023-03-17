(cl:in-package #:iconoclast-builder-test)

(defun test-symbol-macrolet-1 ()
  (let ((result (bld::test '(symbol-macrolet ()))))
    (assert (equal (convert-ast result)
                   '(ico:symbol-macrolet-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil)
                     ("symbol-expansion-asts" nil))))))

(defun test-symbol-macrolet ()
  (format *trace-output* "Testing SYMBOL-MACROLET~%")
  (test-symbol-macrolet-1))
