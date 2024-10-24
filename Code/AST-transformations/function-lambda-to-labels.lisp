(cl:in-package #:iconoclast-ast-transformations)

;;;; This function turns an AST representing a form such as:
;;;;
;;;;    (FUNCTION (LAMBDA <lambda-list> <body>))
;;;;
;;;; Into:
;;;;
;;;;    (LABELS ((<name> <lambda-list> <body>)) (FUNCTION <name>)) 
;;;;
;;;; where <name> is a generated symbol.

(defun function-lambda-to-labels (function-ast)
  (let* ((function-name-definition-ast
           (make-instance 'ico:function-definition-ast
             :name (gensym)))
         (function-name-reference-ast
           (make-instance 'ico:function-reference-ast
             :name (ico:name function-name-definition-ast)
             :definition-ast
             function-name-definition-ast))
         (argument-ast (ico:name-ast function-ast)))
    (reinitialize-instance function-name-definition-ast
      :reference-asts
      (list function-name-reference-ast))
    (make-instance 'ico:labels-ast
      :binding-asts
      (list (make-instance 'ico:local-function-ast
              :name-ast function-name-definition-ast
              :lambda-list-ast (ico:lambda-list-ast argument-ast)
              :declaration-asts (ico:declaration-asts argument-ast)
              :form-asts (ico:form-asts argument-ast)
              :origin (ico:origin argument-ast)))
      :form-asts
      (list (make-instance 'ico:function-ast
              :name-ast function-name-reference-ast
              :origin (ico:origin function-ast))))))

(defclass function-lambda-to-labels-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client function-lambda-to-labels-client) (ast ico:function-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (let ((argument-ast (ico:name-ast ast)))
    (if (typep argument-ast 'ico:lambda-expression-ast)
        (function-lambda-to-labels ast)
        ast)))

(defun function-lambda-to-labels-everywhere (ast)
  (let ((client (make-instance 'function-lambda-to-labels-client)))
    (iaw:walk-ast client ast)))
