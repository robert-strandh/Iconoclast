(cl:in-package #:iconoclast-ast-transformations)

;;;; This function turns an AST representing a form such as:
;;;;
;;;;    ((LAMBDA <lambda-list> <body>) <argument>*)
;;;;
;;;; Into:
;;;;
;;;;    (LABELS ((<name> <lambda-list> <body>)) (<name> <argument>*)
;;;;
;;;; where <name> is a generated symbol.

(defun application-lambda-to-labels (application-ast)
  (let* ((function-name-definition-ast
           (make-instance 'ico:definition-ast
             :name (gensym)))
         (function-name-reference-ast
           (make-instance 'ico:function-reference-ast
             :name (ico:name function-name-definition-ast)
             :definition-ast
             function-name-definition-ast))
         (operator-ast (ico:function-name-ast application-ast)))
    (reinitialize-instance function-name-definition-ast
      :reference-asts
      (list function-name-reference-ast))
    (make-instance 'ico:labels-ast
      :binding-asts
      (list (make-instance 'ico:local-function-ast
              :name-ast function-name-definition-ast
              :lambda-list-ast (ico:lambda-list-ast operator-ast)
              :declaration-asts (ico:declaration-asts operator-ast)
              :form-asts (ico:form-asts operator-ast)
              :origin (ico:origin operator-ast)))
      :form-asts
      (list (make-instance 'ico:application-ast
              :function-name-ast function-name-reference-ast
              :argument-asts (ico:argument-asts application-ast)
              :origin (ico:origin application-ast))))))

(defclass application-lambda-to-labels-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client application-lambda-to-labels-client) (ast ico:application-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (let ((operator-ast (ico:function-name-ast ast)))
    (if (typep operator-ast 'ico:lambda-expression-ast)
        (application-lambda-to-labels ast)
        ast)))
                  
(defun application-lambda-to-labels-everywhere (ast)
  (let ((client (make-instance 'application-lambda-to-labels-client)))
    (iaw:walk-ast client ast)))
