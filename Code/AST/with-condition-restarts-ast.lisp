(cl:in-package #:iconoclast)

(define-ast-class with-condition-restarts-ast (ast)
  ((1 condition-form-ast)
   (1 restarts-form-ast)
   (* form-asts)))
