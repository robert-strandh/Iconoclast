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

(defun unparse-rest-section-ast (ast)
  `(&rest ,(name (first (parameter-asts ast)))))

(defgeneric unparse-lambda-list-ast (lambda-list))

(defmethod unparse-lambda-list-ast
    ((ast ordinary-lambda-list-ast))
  (append
   (unparse-section-ast (required-section-ast ast))
   (unparse-section-ast (optional-section-ast ast))
   (unparse-rest-section-ast (rest-section-ast ast))
   (unparse-section-ast (key-section-ast ast))
   (unparse-section-ast (aux-section-ast ast))))

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast generic-function-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast specialized-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast macro-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast destructuring-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast boa-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast defsetf-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast deftype-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast define-modify-macro-lambda-list-ast))
  nil)

(defmethod unparse-lambda-list-ast
    ((lambda-list-ast define-method-combination-arguments-lambda-list-ast))
  nil)
