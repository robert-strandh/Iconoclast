(cl:in-package #:iconoclast-visualizer)

(defgeneric layout (ast))

(defmethod layout (ast)
  '())

(defmethod layout ((ast ico:multiple-value-bind-ast))
  '((40 ico:variable-name-asts)
    (30 ico:values-ast)
    (20 ico:declaration-asts)
    (10 ico:form-asts)))

(defmethod layout ((ast ico:application-ast))
  '((20 ico:function-name-ast)
    (30 ico:argument-asts)))

(defmethod layout ((ast ico:lambda-expression-ast))
  '((40 ico:lambda-list-ast)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:single-parameter-section-ast))
  `((20 ico:parameter-ast)))

(defmethod layout ((ast ico:multi-parameter-section-ast))
  `((20 ico:parameter-asts)))

(defmethod layout ((ast ico:ordinary-lambda-list-ast))
  `((20 ico:required-section-ast)
    (20 ico:optional-section-ast)
    (20 ico:rest-section-ast)
    (20 ico:key-section-ast)
    (20 ico:aux-section-ast)))
