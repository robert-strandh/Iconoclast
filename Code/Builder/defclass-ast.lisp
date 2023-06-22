(cl:in-package #:iconoclast-builder)

(define-make-node-method :defclass ico:defclass-ast)

(define-relations ico:defclass-ast
  ((:metaclass ico:type-name-ast ico:metaclass-ast)
   (:default-initarg ico:default-initarg-ast ico:default-initarg-asts)))
