(cl:in-package #:iconoclast)

;;; FIXME: We thought it was a good idea to have TEST-AST-MIXIN as a
;;; superclass here, but TEST-AST-MIXIN is used in the IF-AST and then
;;; the relation between the IF-AST and the test is called :TEST,
;;; However a similar relation between COND-CLAUSE-AST and the test is
;;; called :TEST-FORM, so we can't currently use TEST-AST-MIXIN here.

;; (define-ast-class cond-clause-ast (test-ast-mixin form-asts-mixin ast)
;;   ())

(define-ast-class cond-clause-ast (form-asts-mixin ast)
  ((1 test-form-ast)))

(define-ast-class cond-ast (clause-asts-mixin ast)
  ())
