(cl:in-package #:iconoclast)

;;; This is the root class of all ASTs that mention a variable. Here we
;;; consider a function name as being a variable.
(defclass variable-ast (ast)
  ())

(defgeneric referencing-variable-asts (ast))

(defgeneric (setf referencing-variable-asts) (value ast))

(defclass variable-definition-ast (name-ast-mixin variable-ast)
  (;; This slot contains a list of VARIABLE-REFERENCE-ASTs.
   (%referencing-variable-asts
      :initarg :referencing-variable-asts
      :accessor referencing-variable-asts)))

(defgeneric defining-variable-ast (ast))

(defclass variable-reference-ast (ast)
  ((%defining-variable-ast
      :initarg :defining-variable-ast
      :reader defining-variable-ast)))
