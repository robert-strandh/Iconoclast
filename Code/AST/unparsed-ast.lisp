(cl:in-package #:iconoclast)

(defclass unparsed-ast (ast)
  ())

(defgeneric form (ast))

(defclass unparsed-form-ast (unparsed-ast)
  ((%form
      :initarg :form
      :reader form)))
