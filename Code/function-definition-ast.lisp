(cl:in-package #:iconoclast)

;;; A parameter group is represented as a list.  The required
;;; parameter group is just a list of VARIABLE-ASTs.  The first
;;; element of any other parameter group is the lambda-list keyword
;;; that uniquely identifies that parameter group.

;;; We represent the lambda list as a list of parameter groups.  The
;;; first element of a lambda list is the required parameter group,
;;; and it is always present.  Other parameter groups are present if
;;; and only if the corresponding lambda-list keyword is present in
;;; the original lambda list.  This representation allows for
;;; implementation-specific lambda-list keywords.  The parameter
;;; groups are present in the same order as the corresponding
;;; lambda-list keywords in the original lambda list.

;;; The &OPTIONAL parameter group is represented as a list starting
;;; with the lambda-list keyword &OPTIONAL, followed by zero or more
;;; OPTIONAL-PARAMETER-ASTs.

(defgeneric variable-ast (parameter-ast))

(defgeneric init-form-ast (parameter-ast))

(defgeneric supplied-p-parameter-ast (parameter-ast))

(defclass optional-parameter-ast (ast)
  ((%variable-ast
      :initarg :variable-ast
      :reader variable-ast)
   ;; If there is no init-form in the source code, then this slot
   ;; contains a LITERAL-AST with NIL in it, but the origin slot of
   ;; that AST will contain NIL.
   (%init-form-ast
      :initarg :init-form-ast
      :reader init-form-ast)
   ;; If there is no supplied-p-parameter in the source code, then
   ;; this slot contains a LEXICAL-VARIABLE-AST with some bogus name,
   ;; but the origin slot of that VARIABLE-AST will contain NIL.
   (%supplied-p-parameter-ast
      :initarg :supplied-p-parameter-ast
      :reader supplied-p-parameter-ast)))

;;; The &REST parameter group is represented as a list of two
;;; elements, the lambda-list keyword &REST and a VARIABLE-AST.

;;; The &KEY parameter group is represented as a list starting with
;;; the lambda-list keyword &KEY, followed by a zer or more
;;; KEY-PARAMETER-ASTs.

(defgeneric keyword-name-ast (parameter-ast))

(defclass key-parameter-ast (ast)
  ((%variable-ast
      :initarg :variable-ast
      :reader variable-ast)
   ;; If there is no explicit keyword-name in the source code, then
   ;; this slot contains a LITERAL-AST with a name generated from the
   ;; name of the variable, but the origin slot of that AST will
   ;; contain NIL.
   (%keyword-name-ast
      :initarg :keyword-name-ast
      :reader keyword-name-ast)
   ;; If there is no init-form in the source code, then this slot
   ;; contains a LITERAL-AST with NIL in it, but the origin slot of
   ;; that AST will contain NIL.
   (%init-form-ast
      :initarg :init-form-ast
      :reader init-form-ast)
   ;; If there is no supplied-p-parameter in the source code, then
   ;; this slot contains a LEXICAL-VARIABLE-AST with some bogus name,
   ;; but the origin slot of that VARIABLE-AST will contain NIL.
   (%supplied-p-parameter-ast
      :initarg :supplied-p-parameter-ast
      :reader supplied-p-parameter-ast)))

;;; The &ALLOW-OTHER-KEYS parameter group is represented as a
;;; singleton list with the lambda-list keyword &ALLOW-OTHER-KEYS as
;;; its only element.

;;; The &AUX parameter group is represented as a list starting with
;;; the &AUX lambda-list keyword, followed by zero or more
;;; LET-BINDING-ASTs.

(defgeneric lambda-list (ast))

(defclass lambda-list-ast (ast)
  ())

(defclass function-definition-ast
    (declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ((%lambda-list
      :initarg :lambda-list
      :reader lambda-list)))

