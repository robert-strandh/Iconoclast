(cl:in-package #:iconoclast-builder-test)

;;; Test that (LOCALLY) generates a LOCALLY-AST with an empty
;;; list of declarations and an empty list of forms.
(defun test-locally-1 ()
  (let ((result (bld::test '(locally))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts" nil)
                     ("form-asts" nil))))))

(defun test-locally-2 ()
  (let ((result (bld::test '(locally 234))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts" nil)
                     ("form-asts"
                      ((bld:unparsed-form-ast :form 234))))))))

;;; Test that the FORM-ASTs appear in the right order.
(defun test-locally-3 ()
  (let ((result (bld::test '(locally 234 345))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts" nil)
                     ("form-asts"
                      ((bld:unparsed-form-ast :form 234)
                       (bld:unparsed-form-ast :form 345))))))))

;;; None of these tests has any declarations in it.  We test for
;;; declarations using LOCALLY in a later test when we test the
;;; parsing of declarations.
(defun test-locally ()
  (test-locally-1)
  (test-locally-2)
  (test-locally-3))
