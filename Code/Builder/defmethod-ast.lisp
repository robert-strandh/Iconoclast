(cl:in-package #:iconoclast-builder)

(define-make-node-method :specialized-parameter ico:specialized-parameter-ast)

(define-relations ico:specialized-parameter-ast
  ((:name ico:variable-name-ast ico:name-ast)
   (:specializer t ico:specializer-ast)))

(define-make-node-method :defmethod ico:defmethod-ast)

(define-relations ico:defmethod-ast
  ((:name ico:function-name-ast ico:name-ast)
   (:qualifier t ico:method-qualifier-asts)))
