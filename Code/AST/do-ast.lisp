(cl:in-package #:iconoclast)

(defgeneric step-form-ast (ast))

;;; We can't use the VARIABLE-NAME-AST provided by
;;; VARIABLE-NAME-AST-MIXIN because that one has a relation called
;;; :NAME, and for DO it is called VARIABLE-NAME.

(define-ast-class do-variable-name-ast (name-ast)
  ())
  
(define-ast-class do-iteration-variable-ast (ast)
  ((1 do-variable-name-ast)
   (? init-form-ast)
   (? step-form-ast)))

(define-ast-class do-do*-ast
    (segment-asts-mixin declaration-asts-mixin ast)
  ((* do-iteration-variable-asts)
   (* result-asts)
   (1 end-test-ast)))

(define-ast-class do-ast (do-do*-ast)
  ())

(define-ast-class do*-ast (do-do*-ast)
  ())
