(cl:in-package #:iconoclast)

(define-ast-class documentation-ast (ast)
  ((%string :initarg :string :reader %string)))
