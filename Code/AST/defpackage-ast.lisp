(cl:in-package #:iconoclast)

(defgeneric package-name-ast (import-from-ast))

(defclass import-from-ast (name-asts-mixin ast)
  ((%package-name-ast
    :initarg :package-name-ast
    :reader package-name-ast)))

(defgeneric nickname-asts (defpackage-ast))

(defgeneric use-asts (defpackage-ast))

(defgeneric export-asts (defpackage-ast))

(defgeneric intern-asts (defpackage-ast))

(defgeneric shadow-asts (defpackage-ast))

(defgeneric import-from-asts (defpackage-ast))

(defgeneric shadowing-import-from-asts (defpackage-ast))

(defclass defpackage-ast (name-ast-mixin documentation-ast-mixin ast)
  ((%nickname-asts
    :initform '()
    :initarg :nickname-asts
    :reader nickname-asts)
   (%use-asts
    :initform '()
    :initarg :use-asts
    :reader use-asts)
   (%export-asts
    :initform '()
    :initarg :export-asts
    :reader export-asts)
   (%intern-asts
    :initform '()
    :initarg :intern-asts
    :reader intern-asts)
   (%shadow-asts
    :initform '()
    :initarg :shadow-asts
    :reader shadow-asts)
   (%import-from-asts
    :initform '()
    :initarg :import-from-asts
    :reader import-from-asts)
   (%shadowing-import-from-asts
    :initform '()
    :initarg :shadowing-import-from-asts
    :reader shadowing-import-from-asts)))
  
(defmethod children append ((ast defpackage-ast))
  (list (cons "nickname-asts" (nickname-asts ast))
        (cons "use-asts" (use-asts ast))
        (cons "export-asts" (export-asts ast))
        (cons "intern-asts" (intern-asts ast))
        (cons "shadow-asts" (shadow-asts ast))
        (cons "import-from-asts" (import-from-asts ast))
        (cons "shadowing-import-from-asts" (shadowing-import-from-asts ast))))
