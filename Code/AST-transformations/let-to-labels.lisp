(cl:in-package #:iconoclast-ast-transformations)

;;;; This function turns an AST representing an LET form into an AST
;;;; representing a LABELS form. 

(defclass let-to-labels-client (client) ())

;;; If the BINDING-AST has a FORM-AST that is not NIL, then return it.
;;; Otherwise, build a LITERAL-AST with the literal NIL.
(defun form-ast (binding-ast)
  (let ((result (ico:form-ast binding-ast)))
    (if (null result)
        (make-instance 'ico:literal-ast :literal nil)
        result)))

(defun bindings-and-body-to-labels
    (binding-asts declaration-asts form-asts origin)
  (let* ((name (gensym))
         (local-function-definition
           (make-instance 'ico:function-definition-ast
             :name name))
         (local-function-reference
           (make-instance 'ico:function-reference-ast
             :name name
             :definition-ast local-function-definition)))
    (reinitialize-instance local-function-definition
      :reference-asts (list local-function-reference))
    (make-instance 'ico:labels-ast
      :binding-asts
      (list (make-instance 'ico:local-function-ast
              :name-ast local-function-definition
              :lambda-list-ast
              (make-instance 'ico:ordinary-lambda-list-ast
                :required-section-ast
                (make-instance 'ico:required-section-ast
                  :parameter-asts
                  (loop for binding-ast in binding-asts
                        for variable-name-ast
                          = (ico:variable-name-ast binding-ast)
                        collect (make-instance 'ico:required-parameter-ast
                                  :name-ast variable-name-ast))))
              :declaration-asts declaration-asts
              :form-asts form-asts
              :origin origin))
      :form-asts
      (list (make-instance 'ico:application-ast
              :origin (if (= (length binding-asts) 1)
                          (ico:origin (first binding-asts))
                          nil)
              :function-name-ast local-function-reference
              :argument-asts
              (mapcar #'form-ast binding-asts))))))

(defmethod iaw:walk-ast-node :around
    ((client let-to-labels-client) (ast ico:let-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (bindings-and-body-to-labels
   (ico:binding-asts ast)
   (ico:declaration-asts ast)
   (ico:form-asts ast)
   (ico:origin ast)))

(defparameter *let-to-labels-meter*
  (make-instance 'ast-meter))

(defun let-to-labels (ast)
  (with-ast-meter (*let-to-labels-meter* ast)
    (let ((client (make-instance 'let-to-labels-client)))
      (iaw:walk-ast client ast))))
