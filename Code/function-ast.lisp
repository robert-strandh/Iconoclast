(cl:in-package #:iconoclast)

;;; A parameter group is represented as a list.  The required
;;; parameter group is just a list of VARIABLE-ASTs.  The first
;;; element of any other parameter group is the lambda-list keyword
;;; that uniquely identifies that parameter group.

;;; We represent the lambda list as a list of parameter groups.  The
;;; first element of a lambda list is the required parameter group,
;;; and it is always present.  Other parameter groups are present only
;;; if corresponding lambda-list keyword is present in the original
;;; lambda list.  This representation allows for
;;; implementation-specific lambda-list keywords.  The parameter
;;; groups are present in the same order as the corresponding
;;; lambda-list keywords in the original lambda list.

;;; The &OPTIONAL parameter group is represented as a list starting
;;; with the lambda-list keyword &OPTIONAL, followed by a (possibly
;;; empty) list of OPTIONAL-PARAMETER-ASTs

(defgeneric variable-ast (parameter-ast))

(defgeneric init-form-ast (parameter-ast))

(defgeneric supplied-p-parameter-ast (parameter-ast))

(defclass optional-parameter-ast (ast)
  ((%variable-ast
    :initarg :variable-ast
    :reader variable-ast)
   ;; If there is no init-form in the source code, then this slot
   ;; contains NIL.
   (%init-form-ast
    :initform nil
    :initarg :init-form-ast
    :reader init-form-ast)
   ;; If there is no supplied-p-parameter in the source code, then
   ;; this slot contains NIL.  Otherwise, it contains a VARIABLE-AST.
   (%supplied-p-parameter-ast
    :initform nil
    :initarg :supplied-p-parameter-ast
    :reader supplied-p-parameter-ast)))
