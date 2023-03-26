(cl:in-package #:iconoclast-builder-test)

(defun test-setq-1 ()
  (run-test
      '(setq)
      '(ico:setq-ast
        ("form-asts" nil)
        ("variable-name-asts" nil))))

(defun test-setq-2 ()
  (run-test
      '(setq a 234)
      '(ico:setq-ast
        ("form-asts"
         ((bld:unparsed-form-ast :form 234)))
        ("variable-name-asts"
         ((ico:variable-name-ast :name a))))))

(defun test-setq-3 ()
  (run-test 
      '(setq a 234 b 345)
      '(ico:setq-ast
        ("form-asts"
         ((bld:unparsed-form-ast :form 234)
          (bld:unparsed-form-ast :form 345)))
        ("variable-name-asts"
         ((ico:variable-name-ast :name a)
          (ico:variable-name-ast :name b))))))

(defun test-setq ()
  (format *trace-output* "Testing SETQ~%")
  (test-setq-1)
  (test-setq-2)
  (test-setq-3))
