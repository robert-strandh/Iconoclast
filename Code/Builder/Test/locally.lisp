(cl:in-package #:iconoclast-builder-test)

;;; Test that (LOCALLY) generates a LOCALLY-AST with an empty
;;; list of declarations and an empty list of forms.
(defun test-locally-1 ()
  (run-test
   '(locally)
   '(ico:locally-ast
     ("declaration-asts" nil)
     ("form-asts" nil))))

(defun test-locally-2 ()
  (run-test
   '(locally 234)
   '(ico:locally-ast
     ("declaration-asts" nil)
     ("form-asts"
      ((ico:unparsed-form-ast :form 234))))))

;;; Test that the FORM-ASTs appear in the right order.
(defun test-locally-3 ()
  (run-test
   '(locally 234 345)
   '(ico:locally-ast
     ("declaration-asts" nil)
     ("form-asts"
      ((ico:unparsed-form-ast :form 234)
       (ico:unparsed-form-ast :form 345))))))

;;; None of these tests has any declarations in it.  We test for
;;; declarations using LOCALLY in a later test when we test the
;;; parsing of declarations.
(defun test-locally ()
  (format *trace-output* "Testing LOCALLY~%")
  (test-locally-1)
  (test-locally-2)
  (test-locally-3))
