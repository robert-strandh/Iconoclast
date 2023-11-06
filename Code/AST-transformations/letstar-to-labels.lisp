(cl:in-package #:iconoclast-ast-transformations)

;;;; This transformation is not correct in that it does not take into
;;;; accont the scope of the declarations.

(defclass let*-to-labels-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client let*-to-labels-client) (ast ico:let*-ast))
  (call-next-method)
  (let ((binding-asts (ico:binding-asts ast))
        (declaration-asts (ico:declaration-asts ast))
        (form-asts (ico:form-asts ast)))
    (if (null binding-asts)
        (make-instance 'ico:progn-ast
          :origin (ico:origin ast)
          :form-asts form-asts)
        (let* ((labels-ast
                 (bindings-and-body-to-labels
                  (last binding-asts)
                  ;; This is not quite right.
                  declaration-asts
                  form-asts))
               (result (make-instance 'ico:let*-ast
                         :binding-asts
                         (butlast binding-asts)
                         :form-asts
                         (list labels-ast))))
          (iaw:walk-ast-node client result)))))

(defun let*-to-labels (ast)
  (let ((client (make-instance 'let*-to-labels-client)))
    (iaw:walk-ast client ast)))
