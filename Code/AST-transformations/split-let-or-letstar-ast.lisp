(cl:in-package #:iconoclast-ast-transformations)

(defclass split-let-or-let*-client (client) ())

;;; This function assumes that the AST has at least one BINDING-AST.
;;; It splits the AST into two nested LET-ASTs where the outer one
;;; contains the first BINDING-AST and the inner one contains the
;;; remaining BINDING-ASTs.
(defun split-let-or-let*-once (ast dictionary)
  (let* ((binding-asts (ico:binding-asts ast))
         (binding-ast (first binding-asts))
         (variable-ast (ico:variable-name-ast binding-ast))
         (key (if (typep variable-ast 'ico:special-variable-bound-ast)
                  (ico:name variable-ast)
                  variable-ast))
         (declaration-specifier-asts
           (declaration-specifier-asts dictionary key))
         (inner (make-instance 'ico:let-ast
                  :form-asts (ico:form-asts ast)
                  :binding-asts (rest binding-asts))))
    (remove-declaration-specifier-asts dictionary key)
    (reinitialize-instance ast
      :binding-asts (list binding-ast)
      :declaration-asts
      (list (make-instance 'ico:declare-ast
              :declaration-specifier-asts declaration-specifier-asts))
      :form-asts (list inner))))

(defun split-let-or-let*-ast-helper (ast)
  (let* ((declaration-asts (ico:declaration-asts ast))
         (dictionary (create-declaration-dictionary declaration-asts))
         (ast-to-split ast))
    (loop until (null (ico:binding-asts ast-to-split))
          do (split-let-or-let*-once ast-to-split dictionary)
             (setq ast-to-split (first (ico:form-asts ast-to-split))))
    (let ((declaration-specifier-asts
            (loop for value being each hash-value
                    of dictionary
                  append value)))
      (change-class
       ast 'ico:locally-ast
       :declaration-asts
       (list (make-instance 'ico:declare-ast
               :declaration-specifier-asts declaration-specifier-asts))))))

(defmethod iaw:walk-ast-node :around
    ((client split-let-or-let*-client) (ast ico:let-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (split-let-or-let*-ast-helper ast))

(defmethod iaw:walk-ast-node :around
    ((client split-let-or-let*-client) (ast ico:let*-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (change-class ast 'ico:let-ast)
  (split-let-or-let*-ast-helper ast))

(defun split-let-or-let* (ast)
  (let ((client (make-instance 'split-let-or-let*-client)))
    (iaw:walk-ast client ast)))
