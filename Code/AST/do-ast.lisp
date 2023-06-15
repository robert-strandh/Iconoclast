(cl:in-package #:iconoclast)

(defgeneric step-form-ast (ast))

(defclass do-iteration-variable-ast
    (variable-name-ast-mixin init-form-ast-mixin ast)
  ((%step-form-ast
    :initform nil
    :initarg :step-form-ast
    :reader step-form-ast)))

(defmethod children append ((ast do-iteration-variable-ast))
  (list (cons "step-form-ast" (step-form-ast ast))))

(defgeneric do-iteration-variable-asts (ast))

(defgeneric end-test-ast (ast))

(defgeneric result-ast (ast))

(defclass do-do*-ast (segment-asts-mixin declaration-asts-mixin ast)
  ((%do-iteration-variable-asts
    :initform '()
    :initarg :do-iteration-variable-asts
    :reader do-iteration-variable-asts)
   (%end-test-ast
    :initarg :end-test-ast
    :reader end-test-ast)
   (%result-ast
    :initarg :result-ast
    :reader result-ast)))

(defmethod children append ((ast do-do*-ast))
  (list (cons "do-iteration-variable-asts" (do-iteration-variable-asts ast))
        (cons "end-test-ast" (end-test-ast ast))
        (cons "result-ast" (result-ast ast))))

     
