(cl:in-package #:iconoclast)

;;; This is the root class of all ASTs that mention a variable. Here we
;;; consider a function name as being a variable.
(defclass variable-ast (ast)
  ())

(defgeneric referencing-variable-asts (ast))

(defclass variable-definition-ast (name-ast-mixin variable-ast)
  (;; This slot contains a list of VARIABLE-REFERENCE-ASTs.
   (%referencing-variable-asts
      :initarg :referencing-variable-asts
      :reader referencing-variable-asts)))

(defmethod children append ((ast variable-definition-ast))
  (list (cons "referencing-variable-asts"
              (referencing-variable-asts ast))))

(defgeneric defining-variable-ast (ast))

(defclass variable-reference-ast (ast)
  ((%defining-variable-ast
      :initarg :defining-variable-ast
      :reader defining-variable-ast)))

(defmethod children append ((ast variable-reference-ast))
  (list (cons "defining-variable-ast"
              (defining-variable-ast ast))))
