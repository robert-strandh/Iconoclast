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

(defgeneric init-form-ast (parameter-ast))

(defclass init-form-ast-mixin ()
  ((%init-form-ast
      :initarg :init-form-ast
      :reader init-form-ast)))

(defmethod children append ((ast init-form-ast-mixin))
  (list (cons "init-form-ast" (init-form-ast ast))))

(defclass supplied-p-parameter-ast-mixin ()
  ((%supplied-p-parameter-ast
      :initarg :supplied-p-parameter-ast
      :reader supplied-p-parameter-ast)))

(defmethod children append ((ast supplied-p-parameter-ast-mixin))
  (list (cons "supplied-p-parameter-ast" (supplied-p-parameter-ast ast))))

(defgeneric supplied-p-parameter-ast (parameter-ast))

(defclass optional-parameter-ast
    (supplied-p-parameter-ast-mixin
     init-form-ast-mixin
     variable-ast-mixin
     ast)
  ())

;;; The &REST parameter group is represented as a list of two
;;; elements, the lambda-list keyword &REST and a VARIABLE-AST.

;;; The &KEY parameter group is represented as a list starting with
;;; the lambda-list keyword &KEY, followed by a zer or more
;;; KEY-PARAMETER-ASTs.

(defgeneric keyword-name-ast (parameter-ast))

(defclass key-parameter-ast
    (supplied-p-parameter-ast-mixin
     init-form-ast-mixin
     variable-ast-mixin
     ast)
  (;; If there is no explicit keyword-name in the source code, then
   ;; this slot contains a LITERAL-AST with a name generated from the
   ;; name of the variable, but the origin slot of that AST will
   ;; contain NIL.
   (%keyword-name-ast
      :initarg :keyword-name-ast
      :reader keyword-name-ast)))
   
(defmethod children append ((ast key-parameter-ast))
  (list (cons "keyword-name-ast" (keyword-name-ast ast))))

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
