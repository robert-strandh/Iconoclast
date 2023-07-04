(cl:in-package #:iconoclast)

(define-ast-class import-from-or-shadowing-import-from-ast (ast)
  ((1 package-name-ast)
   (* name-asts)))
    
(define-ast-class import-from-ast
    (import-from-or-shadowing-import-from-ast)
  ())

(define-ast-class shadowing-import-from-ast
    (import-from-or-shadowing-import-from-ast)
  ())

(define-ast-class defpackage-ast (name-ast-mixin documentation-ast-mixin ast)
  ((* nickname-asts)
   (* use-asts)
   (* export-asts)
   (* intern-asts)
   (* shadow-asts)
   (* import-from-asts)
   (* shadowing-import-from-asts)
   (? size-ast)))
