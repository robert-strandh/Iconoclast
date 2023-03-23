(cl:in-package #:iconoclast-builder-test)

(defun test-setq-1 ()
  (let ((result (bld::test '(setq))))
    (assert (equal (convert-ast result)
                   '(ico:setq-ast
                     ("form-asts" nil)
                     ("variable-name-asts" nil))))))

(defun test-setq-2 ()
  (let ((result (bld::test '(setq a 234))))
    (assert (equal (convert-ast result)
                   '(ico:setq-ast
                     ("form-asts"
                      ((bld:unparsed-form-ast :form 234)))
                     ("variable-name-asts"
                      ((ico:variable-name-ast :name a))))))))

(defun test-setq-3 ()
  (let ((result (bld::test '(setq a 234 b 345))))
    (assert (equal (convert-ast result)
                   '(ico:setq-ast
                     ("form-asts"
                      ((bld:unparsed-form-ast :form 234)
                       (bld:unparsed-form-ast :form 345)))
                     ("variable-name-asts"
                      ((ico:variable-name-ast :name a)
                       (ico:variable-name-ast :name b))))))))

(defun test-setq ()
  (format *trace-output* "Testing SETQ~%")
  (test-setq-1)
  (test-setq-2)
  (test-setq-3))
