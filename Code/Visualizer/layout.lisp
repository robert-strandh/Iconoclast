(cl:in-package #:iconoclast-visualizer)

(defgeneric layout (ast))

(defmethod layout (ast)
  '())

(defmethod layout ((ast ico:lambda-expression-ast))
  '((40 ico:lambda-list-ast)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

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

(defmethod layout ((ast ico:incf-ast))
  `((20 ico:place-ast)
    (30 ico:delta-ast)))

(defmethod layout ((ast ico:decf-ast))
  `((20 ico:place-ast)
    (30 ico:delta-ast)))

(defmethod layout ((ast ico:push-ast))
  `((20 ico:item-ast)
    (20 ico:place-ast)))

(defmethod layout ((ast ico:pop-ast))
  `((20 ico:place-ast)))

(defmethod layout ((ast ico:multiple-value-list-ast))
  `((20 ico:form-asts)))

(defmethod layout ((ast ico:multiple-value-setq-ast))
  `((40 ico:name-ast)
    (20 ico:values-ast)))

(defmethod layout ((ast ico:nth-value-ast))
  `((20 ico:n-ast)
    (20 ico:form-ast)))

(defmethod layout ((ast ico:shiftf-ast))
  `((20 ico:value-ast)
    (40 ico:place-asts)))

(defmethod layout ((ast ico:rotatef-ast))
  `((20 ico:place-asts)))

(defmethod layout ((ast ico:defmethod-ast))
  `((20 ico:name-ast)
    (50 ico:method-qualifier-asts)
    (60 ico:lambda-list-ast)
    (40 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:defpackage-ast))
  `((20 ico:name-ast)
    (40 ico:nickname-asts)
    (40 ico:use-asts)
    (40 ico:export-asts)
    (40 ico:shadow-asts)
    (40 ico:import-from-asts)
    (40 ico:shadowing-import-from-asts)
    (40 ico:size-ast)))

(defmethod layout ((ast ico:defvar-ast))
  `((20 ico:variable-name-ast)
    (20 ico:form-ast)))

(defmethod layout ((ast ico:defparameter-ast))
  `((20 ico:variable-name-ast)
    (20 ico:form-ast)))

(defmethod layout ((ast ico:defun-ast))
  `((20 ico:name-ast)
    (60 ico:lambda-list-ast)
    (40 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:defclass-ast))
  `((20 ico:name-ast)
    (60 ico:superclass-asts)
    (40 ico:metaclass-ast)
    (30 ico:slot-specifier-asts)
    (20 ico:default-initarg-asts)))

(defmethod layout ((ast ico:define-condition-ast))
  `((20 ico:name-ast)
    (60 ico:parent-type-asts)
    (40 ico:metaclass-ast)
    (30 ico:slot-specifier-asts)
    (20 ico:default-initarg-asts)
    (20 ico:report-ast)))

(defmethod layout ((ast ico:defgeneric-ast))
  `((20 ico:name-ast)
    (40 ico:lambda-list-ast)
    (20 ico:argument-precedence-order-asts)
    (20 ico:generic-function-class-ast)
    (20 ico:method-class-ast)
    (20 ico:method-combination-name-and-arguments-ast)
    (20 ico:method-description-asts)))

(defmethod layout ((ast ico:declaim-ast))
  `((20 ico:declaration-specifier-asts)))

(defmethod layout ((ast ico:lambda-ast))
  `((20 ico:lambda-list-ast)
    (40 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:prog-or-prog*-ast))
  `((40 ico:binding-asts)
    (20 ico:segment-asts)))

(defmethod layout ((ast ico:prog1-ast))
  `((40 ico:first-form-ast)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:prog2-ast))
  `((60 ico:first-form-ast)
    (40 ico:second-form-ast)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:pushnew-ast))
  `((20 ico:item-ast)
    (20 ico:place-ast)
    (20 ico:key-ast)
    (20 ico:test-ast)
    (20 ico:test-not-ast)))

(defmethod layout ((ast ico:remf-ast))
  `((20 ico:indicator-ast)
    (20 ico:place-ast)))

(defmethod layout ((ast ico:ignore-errors-ast))
  `((20 ico:form-asts)))

(defmethod layout ((ast ico:in-package-ast))
  `((20 ico:name-ast)))

(defmethod layout ((ast ico:check-type-ast))
  `((20 ico:place-ast)
    (20 ico:typespec-ast)))

(defmethod layout ((ast ico:dolist-ast))
  `((40 ico:variable-name-ast)
    (40 ico:list-form-ast)
    (40 ico:result-ast)
    (20 ico:segment-asts)))

(defmethod layout ((ast ico:dotimes-ast))
  `((40 ico:variable-name-ast)
    (40 ico:count-form-ast)
    (40 ico:result-ast)
    (20 ico:segment-asts)))
  
(defmethod layout ((ast ico:do-iteration-variable-ast))
  `((20 ico:do-variable-name-ast)
    (20 ico:init-form-ast)
    (20 ico:step-form-ast)))

(defmethod layout ((ast ico:do-do*-ast))
  `((40 ico:do-iteration-variable-asts)
    (40 ico:end-test-ast)
    (40 ico:result-asts)
    (20 ico:segment-asts)))

(defmethod layout ((ast ico:setf-or-psetf-ast))
  `((20 ico:place-asts)
    (20 ico:value-asts)))

(defmethod layout ((ast ico:print-unreadable-object-ast))
  `((20 ico:object-ast)
    (20 ico:stream-ast)
    (20 ico:type-ast)
    (20 ico:identity-ast)))

(defmethod layout ((ast ico:setq-or-psetq-ast))
  `((20 ico:variable-name-asts)
    (20 ico:value-asts)))

(defmethod layout ((ast ico:typecase-or-etypecase-ast))
  `((20 ico:keyform-ast)
    (20 ico:clause-asts)))

(defmethod layout ((ast ico:ctypecase-ast))
  `((20 ico:keyplace-ast)
    (20 ico:clause-asts)))
  
(defmethod layout ((ast ico:with-accessors-slot-entry-ast))
  `((20 ico:variable-name-ast)
    (20 ico:accessor-name-ast)))

(defmethod layout ((ast ico:with-accessors-ast))
  `((60 ico:slot-entry-asts)
    (40 ico:instance-form-ast)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:with-input-from-string-ast))
  `((20 ico:var-ast)
    (20 ico:string-ast)
    (20 ico:index-ast)
    (20 ico:start-ast)
    (20 ico:end-ast)))

(defmethod layout ((ast ico:with-open-file-ast))
  `((40 ico:stream-ast)
    (40 ico:filespec-ast)
    (30 ico:option-asts)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:with-open-stream-ast))
  `((40 ico:var-ast)
    (40 ico:stream-ast)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:with-output-to-string-ast))
  `((40 ico:var-ast)
    (40 ico:string-ast)
    (40 ico:element-type-ast)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:with-simple-restart-ast))
  `((40 ico:name-ast)
    (40 ico:format-control-ast)
    (40 ico:format-argument-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:slot-entry-ast))
  `((20 ico:variable-name-ast)
    (20 ico:slot-name-ast)))

(defmethod layout ((ast ico:with-slots-ast))
  `((60 ico:slot-entry-asts)
    (40 ico:instance-form-ast)
    (30 ico:declaration-asts)
    (20 ico:form-asts)))

(defmethod layout ((ast ico:local-function-ast))
  `((20 ico:name-ast)
    (60 ico:lambda-list-ast)
    (40 ico:declaration-asts)
    (20 ico:form-asts)))
