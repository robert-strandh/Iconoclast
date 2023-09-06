(cl:in-package #:iconoclast)

(define-ast-class restart-binding-ast (name-ast-mixin ast)
  (;; Maybe factor out this slot.  See for instance
   ;; MULTIPLE-VALUE-CALL-AST.
   (1 function-form-ast)
   (? interactive-function-ast)
   (? report-function-ast)
   (? test-function-ast)))

(define-ast-class restart-bind-ast
    (binding-asts-mixin form-asts-mixin macro-form-ast)
  ())
