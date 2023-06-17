(cl:in-package #:iconoclast)

(defgeneric stream-symbol-ast (ast))

(defgeneric prefix-ast (ast))

(defgeneric per-line-prefix-ast (ast))

(defgeneric suffix-ast (ast))

(defclass pprint-logical-block-ast
    (variable-name-ast-mixin
     object-ast-mixin
     declaration-asts-mixin
     form-asts-mixin
     ast)
  ((%stream-symbol-ast
    :initarg :stream-symbol-ast
    :reader stream-symbol-ast)
   (%prefix-ast
    :initarg :prefix-ast
    :reader prefix-ast)
   (%per-line-prefix-ast
    :initarg :per-line-prefix-ast
    :reader per-line-prefix-ast)
   (%suffix-ast
    :initarg :suffix-ast
    :reader suffix-ast)))

(defmethod children append ((ast pprint-logical-block-ast))
  (list (cons "stream-symbol-ast" (stream-symbol-ast ast))
        (cons "prefix-ast" (prefix-ast ast))
        (cons "per-line-prefix-ast" (per-line-prefix-ast ast))
        (cons "suffix-ast" (suffix-ast ast))))
        

   
