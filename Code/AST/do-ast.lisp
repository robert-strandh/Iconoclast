(cl:in-package #:iconoclast)

(defgeneric step-form-ast (ast))

(define-ast-class do-iteration-variable-ast
    (variable-name-ast-mixin init-form-ast-mixin ast)
  ((? step-form-ast)))

(define-ast-class do-do*-ast
    (segment-asts-mixin result-ast-mixin declaration-asts-mixin ast)
  ((* do-iteration-variable-asts)
   (1 end-test-ast)))

(define-ast-class do-ast (do-do*-ast)
  ())

(define-ast-class do*-ast (do-do*-ast)
  ())
