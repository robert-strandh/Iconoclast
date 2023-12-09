(cl:in-package #:iconoclast-ast-walker)

;;;; This function implements a general AST walker for
;;;; LAMBDA-LIST-ASTs.  All it does it traverse the AST tree without
;;;; invoking any action.  To implement some action, client code can
;;;; define a primary method on WALK-PARAMETER-AST, or an :AROUND
;;;; methods on WALK-SECTION-AST that specializes to a particular
;;;; CLIENT class.

(defgeneric lambda-list-section-accessors (ast))

(defmethod lambda-list-section-accessors
    ((ast ico:ordinary-lambda-list-ast))
  (list #'ico:required-section-ast
        #'ico:optional-section-ast
        #'ico:rest-section-ast
        #'ico:key-section-ast
        #'ico:aux-section-ast))

(defmethod lambda-list-section-accessors
    ((ast ico:specialized-lambda-list-ast))
  (list #'ico:required-section-ast
        #'ico:optional-section-ast
        #'ico:rest-section-ast
        #'ico:key-section-ast
        #'ico:aux-section-ast))

(defmethod lambda-list-section-accessors
    ((ast ico:destructuring-lambda-list-ast))
  (list #'ico:whole-section-ast
        #'ico:required-section-ast
        #'ico:optional-section-ast
        #'ico:rest-section-ast
        #'ico:key-section-ast
        #'ico:aux-section-ast))

(defmethod lambda-list-section-accessors
    ((ast ico:macro-lambda-list-ast))
  (list #'ico:whole-section-ast
        #'ico:environment-section-ast
        #'ico:required-section-ast
        #'ico:optional-section-ast
        #'ico:rest-section-ast
        #'ico:key-section-ast
        #'ico:aux-section-ast))

(defgeneric walk-lambda-list-ast (client ast))

(defgeneric walk-section-ast (client ast))

(defmethod walk-section-ast (client (ast null))
  nil)

(defgeneric walk-parameter-ast (client ast))

(defmethod walk-parameter-ast (client (ast ico:destructuring-lambda-list-ast))
  (walk-lambda-list-ast client ast))

(defmethod walk-section-ast (client (ast ico:single-parameter-section-ast))
  (walk-parameter-ast client (ico:parameter-ast ast)))

(defmethod walk-section-ast (client (ast ico:multi-parameter-section-ast))
  (loop for parameter-ast in (ico:parameter-asts ast)
        do (walk-parameter-ast parameter-ast)))

(defmethod walk-lambda-list-ast (client ast)
  (loop for section-accessor in (lambda-list-section-accessors ast)
        for section-ast = (funcall section-accessor ast)
        do (walk-section-ast client section-ast))

  ast)
