(cl:in-package #:iconoclast-builder)

(define-make-node-method :destructuring-lambda-list ico:lambda-list-ast)

(define-make-node-method
    :local-macro-function-binding ico:lexical-function-ast)
