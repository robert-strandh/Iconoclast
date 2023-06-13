(cl:in-package #:iconoclast)

(defgeneric unparse-section-ast (ast))

(defmethod unparse-section-ast ((ast null))
  '())

(defgeneric unparse-parameter-ast (ast))

(defmethod unparse-parameter-ast ((ast required-parameter-ast))
  (name (name-ast ast)))

(defmethod unparse-parameter-ast ((ast optional-parameter-ast))
  (with-accessors ((name-ast name-ast)
                   (keyword-ast keyword-ast)
                   (init-form-ast init-form-ast)
                   (supplied-p-parameter-ast supplied-p-parameter-ast))
      ast
    (let ((name (if (null keyword-ast)
                    (name name-ast)
                    `(,(name keyword-ast) ,(name name-ast)))))
      (if (null supplied-p-parameter-ast)
          (if (null init-form-ast)
              name
              `(,name ,(form (initform-ast ast))))
          `(,name
            ,(form (init-form-ast ast))
            ,(name (supplied-p-parameter-ast ast)))))))

(defmethod unparse-parameter-ast ((ast aux-parameter-ast))
  `(,(name (name-ast ast)) ,(form (init-form-ast ast))))

(defmethod unparse-parameter-ast ((ast key-parameter-ast))
  (with-accessors ((name-ast name-ast)
                   (init-form-ast init-form-ast)
                   (supplied-p-parameter-ast supplied-p-parameter-ast))
      ast
    (let ((name (name name-ast)))
      (if (null supplied-p-parameter-ast)
          (if (null init-form-ast)
              name
              `(,name ,(form (initform-ast ast))))
          `(,name
            ,(form (init-form-ast ast))
            ,(name (supplied-p-parameter-ast ast)))))))

(defmethod unparse-section-ast ((ast section-ast))
  (loop for parameter-ast in (parameter-asts ast)
        collect (unparse-parameter-ast parameter-ast)))

(defgeneric unparse-lambda-list-ast (lambda-list))

(defmethod unparse-lambda-list-ast
    ((lambda-list ordinary-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list generic-function-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list specialized-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list macro-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list destructuring-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list boa-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list defsetf-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list deftype-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list define-modify-macro-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list define-method-combination-arguments-lambda-list-ast))
  nil)
