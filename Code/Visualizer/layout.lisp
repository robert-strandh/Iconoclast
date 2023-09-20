(cl:in-package #:iconoclast-visualizer)

(defgeneric layout (ast))

(defmethod layout (ast)
  '())

(defmethod layout ((ast ico:multiple-value-bind-ast))
  '((40 ico:variable-name-asts)
    (30 ico:values-ast)
    (20 ico:declaration-asts)
    (10 ico:form-asts)))

