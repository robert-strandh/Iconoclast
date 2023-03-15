(cl:in-package #:iconoclast-builder-test)

;;; Test that (LOCALLY) generates a LOCALLY-AST with an empty
;;; list of declarations and an empty list of forms.
(defun test-locally-1 ()
  (let ((result (bld::test '(locally))))
    (assert (typep result 'ico:locally-ast))
    (assert (null (ico:declaration-asts result)))
    (assert (null (ico:form-asts result)))))

;;; None of these tests has any declarations in it.  We test for
;;; declarations using LOCALLY in a later test when we test the
;;; parsing of declarations.
(defun test-locally ()
  (test-locally-1))
