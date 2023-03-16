(cl:in-package #:iconoclast-builder-test)

;;; Test that (FUNCTION) generates a FUNCTION-AST with an empty
;;; list of declarations and an empty list of forms.
(defun test-function-1 ()
  (let ((result (bld::test '(function f))))
    (assert (equal (convert-ast result)
                   '(ico:function-ast
                     ("name-ast" (ico:function-name-ast :name f)))))))

(defun test-function-2 ()
  (let ((result (bld::test '(function (lambda ())))))
    (assert (equal (convert-ast result)
                   '(ico:function-ast
                     ("name-ast"
                      (ico:function-definition-ast
                       ("declaration-asts" nil)
                       ("documentation-ast" nil)
                       ("form-asts" nil))))))))

;;; None of these tests has any declarations in it.  We test for
;;; declarations using FUNCTION in a later test when we test the
;;; parsing of declarations.
(defun test-function ()
  (format *trace-output* "Testing FUNCTION~%")
  (test-function-1)
  (test-function-2))
