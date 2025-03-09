(cl:in-package #:iconoclast)

;;;; These two classes are used to replace BLOCK-AST and
;;;; RETURN-FROM-AST as a preparation for closure conversion.  The
;;;; semantics of the BLOCK-WITH-VARIABLE-AST is that it defines a
;;;; temporary variable with a unique value.  The same variable is
;;;; referred to by the RETURN-FROM-WITH-VARIABLE-AST.  This way
;;;; closure conversion discovers variable sharing using ordinary
;;;; variable AST classes.

(define-ast-class block-with-variable-ast (block-ast)
  ((1 variable-definition-ast)))

(define-ast-class return-from-with-variable-ast (return-from-ast)
  ((1 variable-reference-ast)))

;; (define-ast-class block-with-variable-ast
;;     (implicit-progn-ast-mixin special-form-ast)
;;   ((1 variable-definition-ast)))

;; (define-ast-class return-from-with-variable-ast
;;     (optional-form-ast-mixin special-form-ast)
;;   ((1 variable-reference-ast)))
