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

(defmethod layout ((ast ico:required-parameter-ast))
  '((20 ico:name-ast)))

(defmethod layout ((ast ico:optional-parameter-ast))
  `((20 ico:name-ast)
    (30 ico:init-form-ast)
    (40 ico:supplied-p-parameter-ast)))

(defmethod layout ((ast ico:key-parameter-ast))
  `((20 ico:keyword-ast)
    (30 ico:name-ast)
    (40 ico:init-form-ast)
    (50 ico:supplied-p-parameter-ast)))

(defmethod layout ((ast ico:aux-parameter-ast))
  `((20 ico:name-ast)
    (30 ico:form-ast)))

(defmethod layout ((ast ico:ordinary-lambda-list-ast))
  `((20 ico:required-section-ast)
    (20 ico:optional-section-ast)
    (20 ico:rest-section-ast)
    (20 ico:key-section-ast)
    (20 ico:aux-section-ast)))

(defmethod layout ((ast ico:when-ast))
  `((40 ico:test-ast)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:unless-ast))
  `((40 ico:test-ast)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:and-ast))
  `((20 ico:form-asts)))

(defmethod layout ((ast ico:or-ast))
  `((20 ico:form-asts)))

(defmethod layout ((ast ico:cond-clause-ast))
  `((20 ico:test-ast)
    (40 ico:form-asts)))

(defmethod layout ((ast ico:cond-ast))
  `((20 ico:clause-asts)))

(defmethod layout ((ast ico:case-normal-clause-ast))
  `((20 ico:key-asts)
    (40 ico:form-asts)))

(defmethod layout ((ast ico:case-otherwise-clause-ast))
  `((40 ico:form-asts)))

(defmethod layout ((ast ico:case-or-ecase-ast))
  `((20 ico:keyform-ast)
    (40 ico:clause-asts)))

(defmethod layout ((ast ico:ccase-ast))
  `((20 ico:keyplace-ast)
    (40 ico:clause-asts)))


