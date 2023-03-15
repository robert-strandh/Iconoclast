(cl:in-package #:iconoclast-builder-test)

;;; Test that (LOCALLY) generates a LOCALLY-AST with an empty
;;; list of declarations and an empty list of forms.
(defun test-locally-1 ()
  (let ((result (bld::test '(locally))))
    (assert (typep result 'ico:locally-ast))
    (assert (null (ico:declaration-asts result)))
    (assert (null (ico:form-asts result)))))

(defun test-locally-2 ()
  (let ((result (bld::test '(locally 234))))
    (assert (typep result 'ico:locally-ast))
    (assert (null (ico:declaration-asts result)))
    (let ((form-asts (ico:form-asts result)))
      (assert (= (length form-asts) 1))
      (let ((form-ast (first form-asts)))
        (assert (typep form-ast 'bld:unparsed-form-ast))
        (assert (eql (bld:form form-ast) 234))))))

;;; None of these tests has any declarations in it.  We test for
;;; declarations using LOCALLY in a later test when we test the
;;; parsing of declarations.
(defun test-locally ()
  (test-locally-1)
  (test-locally-2))
