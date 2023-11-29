(cl:in-package #:iconoclast-ast-transformations)

(defclass replace-special-let-with-bind-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client replace-special-let-with-bind-client) (ast ico:let-ast))
  (call-next-method)
  (let ((binding-asts (ico:binding-asts ast)))
    (assert (= 1 (length binding-asts)))
    (let* ((binding-ast (first binding-asts))
           (variable-name-ast (ico:variable-name-ast binding-ast))
           (binding-form-ast (ico:form-ast binding-ast)))
      (when (typep variable-name-ast 'ico:special-variable-bound-ast)
        (change-class
         ast 'ico:special-variable-bind-ast
         :binding-ast (make-instance 'ico:special-variable-binding-ast
                        :variable-name-ast variable-name-ast
                        :form-ast (if (null binding-form-ast)
                                      (make-instance 'ico:literal-ast
                                        :literal 'nil)
                                      binding-form-ast))))))
  ast)

(defun replace-special-let-with-bind (ast)
  (let ((client (make-instance 'replace-special-let-with-bind-client)))
    (iaw:walk-ast client ast)))
