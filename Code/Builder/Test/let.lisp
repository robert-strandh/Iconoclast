(cl:in-package #:iconoclast-builder-test)

(defun test-let-1 ()
  (run-test
   '(let ())
   '(ico:let-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("variable-binding-asts" nil))))

(defun test-let-2 ()
  (run-test
   '(let (x))
   '(ico:let-ast
     ("declaration-asts" nil)
     ("form-asts" nil)
     ("variable-binding-asts"
      ((ico:variable-binding-ast ("form-ast" nil)
        ("variable-name-ast" (ico:variable-name-ast :name x))))))))

(defun test-let ()
  (format *trace-output* "Testing LET~%")
  (test-let-1)
  (test-let-2))
