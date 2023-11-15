(cl:in-package #:iconoclast-ast-transformations)

(defclass split-let-or-letstar-client (client) ())

(defun compute-declaration-ast-associations (ast)
  (let ((declaration-specifier-asts
          (extract-declaration-specifier-asts (ico:declaration-asts ast))))
    (let ((variable-ast-pairs '())
          (other-asts '()))
      (loop for declaration-specifier-ast in declaration-specifier-asts
            do (if (typep declaration-specifier-ast
                          'ico:restricting-declaration-specifier-ast)
                   (let ((pairs (split-declaration-specifier-ast
                                 declaration-specifier-ast)))
                     (loop for pair in pairs
                           for (name-ast . declaration-specifier-ast)
                             = pair
                           do (if (typep name-ast 'ico:variable-name-ast)
                                  (push pair variable-ast-pairs)
                                  (push declaration-specifier-ast
                                        other-asts))))
                   (push declaration-specifier-ast other-asts)))
      (values variable-ast-pairs other-asts))))

(defun split-let-or-let-star-ast-helper (ast)
  (multiple-value-bind (associated-asts other-asts)
      (compute-declaration-ast-associations ast)
    (labels ((split (ast binding-asts associated-asts)
               (if (null binding-asts)
                   (change-class
                    ast 'ico:locally-ast
                    :declaration-asts
                    (list (make-instance 'ico:declaration-ast
                            :declaration-specifier-asts other-asts)))
                   (let ((inner
                           (make-instance 'ico:let-ast
                             :form-asts (ico:form-asts ast))))
                     (reinitialize-instance ast
                       :binding-asts (list (first binding-asts))
                       :declaration-asts
                       (list (make-instance 'ico:declaration-ast
                               :declaration-specifier-asts 
                               (first associated-asts)))
                       :form-asts (list inner))
                     (split inner
                            (rest binding-asts)
                            (rest associated-asts))))
               ast))
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
