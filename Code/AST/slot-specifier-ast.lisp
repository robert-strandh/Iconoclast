(cl:in-package #:iconoclast)

(define-ast-class slot-specifier-ast
    (initform-ast-mixin documentation-ast-mixin name-ast-mixin ast)
  ((* initarg-asts)
   (? type-specifier-ast)
   (* reader-asts)
   (* writer-asts)
   (* accessor-asts)
   (? allocation)))

(define-ast-class initarg-name-ast (name-mixin ast)
  ())
