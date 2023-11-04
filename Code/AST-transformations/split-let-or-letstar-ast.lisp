(cl:in-package #:iconoclast-ast-transformations)

(defclass split-let-or-letstar-client (client) ())

(defun compute-declaration-ast-associations (ast)
  (let ((declaration-specifier-asts
          (extract-declaration-specifier-asts (ico:declaration-asts ast))))
    (let ((named-ast-pairs '())
          (not-named-asts '()))
      (loop for declaration-specifier-ast in declaration-specifier-asts
            do (multiple-value-bind (named not-named)
                   (split-declaration-specifier-ast
                    declaration-specifier-asts)
                 (setf named-ast-pairs (append named-ast-pairs named))
                 (setf not-named-asts (append not-named-asts not-named))))
      (let* ((variable-name-asts
               (loop for variable-binding-ast in (ico:binding-asts ast)
                     collect (ico:variable-name-ast variable-binding-ast))))
        (multiple-value-bind (associated-asts remaining-asts)
            (associate-variable-asts-and-declaration-specifier-asts
             variable-name-asts named-ast-pairs)
          (values associated-asts
                  (append remaining-asts not-named-asts)))))))

(defun split-let-or-let-star-ast-helper (ast)
  (multiple-value-bind (associated-asts other-asts)
      (compute-declaration-ast-associations ast)
    (labels ((split (ast binding-asts associated-asts)
               (if (null binding-asts)
                   (change-class
                    ast 'ico:locally-ast
                    :declaration-asts other-asts)
                   (let ((inner
                           (make-instance 'ico:let-ast
                             :form-asts (ico:form-asts ast))))
                     (reinitialize-instance ast
                       :binding-asts (list (first binding-asts))
                       :declaration-asts
                       (make-instance 'ico:declaration-ast
                         :declaration-specifier-asts 
                         (list (first associated-asts)))
                       :form-asts (list inner))
                     (split inner
                            (rest binding-asts)
                            (rest associated-asts))))))
      (split ast (ico:binding-asts ast) associated-asts))))

(defmethod iaw:walk-ast-node :around
    ((client split-let-or-letstar-client) (ast ico:let-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (split-let-or-let-star-ast-helper ast))

(defmethod iaw:walk-ast-node :around
    ((client split-let-or-letstar-client) (ast ico:let*-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (change-class ast 'ico:let-ast)
  (split-let-or-let-star-ast-helper ast))

(defun split-let-or-letstar-ast (ast)
  (let ((client (make-instance 'split-let-or-letstar-client)))
    (iaw:walk-ast client ast)))
