(cl:in-package #:iconoclast)

(define-ast-class name-ast (name-mixin ast)
  ())

(define-ast-class variable-name-ast (name-ast)
  ())

;;; This class can be used in a call to CHANGE-CLASS with a
;;; VARIABLE-NAME-AST as an argument, once it is known that the
;;; VARIABLE-NAME-AST corresponds to the definition of a variable.
(define-ast-class variable-definition-ast (variable-name-ast)
  (;; This slot contains a list of VARIABLE-REFERENCE-ASTs that
   ;; correspond to references to the variable that is defined by this
   ;; AST.
   (* variable-reference-asts)))

;;; This class can be used in a call to CHANGE-CLASS with a
;;; VARIABLE-NAME-AST as an argument, once it is known that the
;;; VARIABLE-NAME-AST corresponds to a variable reference.
(define-ast-class variable-reference-ast (variable-name-ast)
  (;; This slot contains the VARIABLE-DEFINITION-AST that corresponds
   ;; to the definition of the variable that is referred to by this
   ;; AST.
   (? definition-ast)))

;;; This class can be used in a call to CHANGE-CLASS with a
;;; VARIABLE-NAME-AST as an argument, once it is known that the
;;; VARIABLE-NAME-AST corresponds the binding of a special variable.
(define-ast-class special-variable-bound-ast (variable-name-ast)
  ())

;;; This class can be used in a call to CHANGE-CLASS with a
;;; VARIABLE-NAME-AST as an argument, once it is known that the
;;; VARIABLE-NAME-AST corresponds a reference to a special variable.
(define-ast-class special-variable-reference-ast (variable-name-ast)
  ())

(define-ast-class function-name-ast (name-ast)
  ())

;;; This class can be used in a call to CHANGE-CLASS with a
;;; FUNCTION-NAME-AST as an argument, once it is known that the
;;; FUNCTION-NAME-AST corresponds to the definition of a local
;;; function name as in a LABELS or FLET form.
(define-ast-class function-definition-ast (function-name-ast)
  (;; This slot contains a list of FUNCTION-REFERENCE-ASTs that
   ;; correspond to references to the function name that is defined by
   ;; this AST.
   (* local-function-name-reference-asts)))

;;; This class can be used in a call to CHANGE-CLASS with a
;;; FUNCTION~-NAME-AST as an argument, once it is known that the
;;; FUNCTION-NAME-AST corresponds to a reference to a local function.
(define-ast-class function-reference-ast (function-name-ast)
  (;; This slot contains the FUNCTION-DEFINITION-AST that corresponds
   ;; to the definition of the local function that is referred to by
   ;; this AST.
   (? definition-ast)))

;;; This class can be used in a call to CHANGE-CLASS with a
;;; FUNCTION-NAME-AST as an argument, once it is known that the
;;; FUNCTION-NAME-AST corresponds a reference to a global-function.
(define-ast-class global-function-name-reference-ast (function-name-ast)
  ())

;;; This class can be used in a call to CHANGE-CLASS with a
;;; FUNCTION-NAME-AST as an argument, once it is known that the
;;; FUNCTION-NAME-AST corresponds the definition of a global-function.
(define-ast-class global-function-name-definition-ast (function-name-ast)
  ())

(define-ast-class type-name-ast (name-ast)
  ())
