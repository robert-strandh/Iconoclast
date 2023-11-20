(cl:in-package #:iconoclast-ast-transformations)

(defgeneric extract-variable-asts-in-parameter (parameter-ast))

(defmethod extract-variable-asts-in-parameter
    ((parameter-ast ico:required-parameter-ast))
  (list (ico:name-ast parameter-ast)))

(defmethod extract-variable-asts-in-parameter
    ((parameter-ast ico:optional-parameter-ast))
  (let ((name-ast (ico:name-ast parameter-ast))
        (supplied-p-ast (ico:supplied-p-parameter-ast parameter-ast)))
    (if (null supplied-p-ast)
        (list name-ast)
        (list name-ast supplied-p-ast))))

(defmethod extract-variable-asts-in-parameter
    ((parameter-ast ico:rest-parameter-ast))
  (list (ico:name-ast parameter-ast)))

(defmethod extract-variable-asts-in-parameter
    ((parameter-ast ico:key-parameter-ast))
  (let ((name-ast (ico:name-ast parameter-ast))
        (supplied-p-ast (ico:supplied-p-parameter-ast parameter-ast)))
    (if (null supplied-p-ast)
        (list name-ast)
        (list name-ast supplied-p-ast))))

(defmethod extract-variable-asts-in-parameter
    ((parameter-ast ico:aux-parameter-ast))
  (list (ico:name-ast parameter-ast)))

(defgeneric extract-variable-asts-in-section (section-ast))

(defmethod extract-variable-asts-in-section
    ((section-ast null))
  '())

(defmethod extract-variable-asts-in-section
    ((section-ast ico:single-parameter-section-ast))
  (extract-variable-asts-in-parameter (ico:parameter-ast section-ast)))

(defmethod extract-variable-asts-in-section
    ((section-ast ico:multi-parameter-section-ast))
  (loop for parameter-ast in (ico:parameter-asts section-ast)
        append (extract-variable-asts-in-parameter parameter-ast)))

(defgeneric extract-variable-asts-in-lambda-list (lambda-list-ast))

(defmethod extract-variable-asts-in-lambda-list
    ((ast ico:ordinary-lambda-list-ast))
  (loop for accessor
          in (list #'ico:required-section-ast
                   #'ico:optional-section-ast
                   #'ico:rest-section-ast
                   #'ico:key-section-ast
                   #'ico:aux-section-ast)
        append (extract-variable-asts-in-section
                (funcall accessor ast))))

(defmethod extract-variable-asts-in-lambda-list
    ((ast ico:specialized-lambda-list-ast))
  (loop for accessor
          in (list #'ico:required-section-ast
                   #'ico:optional-section-ast
                   #'ico:rest-section-ast
                   #'ico:key-section-ast
                   #'ico:aux-section-ast)
        append (extract-variable-asts-in-section
                (funcall accessor ast))))
