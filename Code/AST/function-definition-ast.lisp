(cl:in-package #:iconoclast)

(defclass supplied-p-parameter-ast-mixin ()
  ((%supplied-p-parameter-ast
      :initarg :supplied-p-parameter-ast
      :reader supplied-p-parameter-ast)))

(defmethod children append ((ast supplied-p-parameter-ast-mixin))
  (list (cons "supplied-p-parameter-ast" (supplied-p-parameter-ast ast))))

(defgeneric supplied-p-parameter-ast (parameter-ast))

;;; The &REST parameter group is represented as a list of two
;;; elements, the lambda-list keyword &REST and a VARIABLE-AST.

;;; The &KEY parameter group is represented as a list starting with
;;; the lambda-list keyword &KEY, followed by a zer or more
;;; KEY-PARAMETER-ASTs.

(defgeneric keyword-name-ast (parameter-ast))

(defclass key-parameter-ast
    (supplied-p-parameter-ast-mixin
     init-form-ast-mixin
     variable-name-ast-mixin
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

(defclass function-definition-ast
    (declaration-asts-mixin
     documentation-ast-mixin
     form-asts-mixin
     ast)
  ((%lambda-list
      :initarg :lambda-list
      :reader lambda-list)))
