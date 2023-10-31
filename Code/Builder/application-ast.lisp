(cl:in-package #:iconoclast-builder)

(define-make-node-method :application ico:application-ast)

(define-relations ico:application-ast
  ((:function-name t ico:function-name-ast)
   (:function t ico:function-name-ast)
   (:argument t ico:argument-asts)))

(defmethod abp:node-relations (builder (ast ico:application-ast))
  (if (null (ico:argument-asts ast))
      (if (typep (ico:function-name-ast ast) 'ico:lambda-expression-ast)
          '((:function . 1))
          '((:function-name . 1)))
      (if (typep (ico:function-name-ast ast) 'ico:lambda-expression-ast)
          '((:function . 1) (:argument . *))
          '((:function-name . 1) (:argument . *)))))
