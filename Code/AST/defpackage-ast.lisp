(cl:in-package #:iconoclast)

(define-ast-class import-from-ast (name-asts-mixin ast)
  ((%package-name-ast
    :initarg :package-name-ast
    :reader package-name-ast)))

(define-ast-class defpackage-ast (name-ast-mixin documentation-ast-mixin ast)
  ((* nickname-asts)
   (* use-asts)
   (* export-asts)
   (* intern-asts)
   (* shadow-asts)
   (* import-from-asts)
   (* shadowing-import-from-asts)))
