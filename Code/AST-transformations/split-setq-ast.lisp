(cl:in-package #:iconoclast-ast-transformations)

(defclass split-setq-client (client) ())

(defun make-new-setq-ast (variable-name-ast value-ast)
  (if (typep variable-name-ast 'ico:special-variable-reference-ast)
      (make-instance 'ico:special-variable-setq-ast
        :variable-name-ast variable-name-ast
        :value-ast value-ast)
      (make-instance 'ico:simple-setq-ast
        :variable-name-ast variable-name-ast
        :value-ast value-ast)))

(defun split-setq-helper (ast)
  (let ((variable-name-asts (ico:variable-name-asts ast))
        (value-asts (ico:value-asts ast)))
    (if (null variable-name-asts)
        (change-class ast 'ico:literal-ast
          :literal 'nil)
        (change-class ast 'ico:progn-ast
           :form-asts
           (loop for variable-name-ast in variable-name-asts
                 for value-ast in value-asts
                 collect (make-new-setq-ast variable-name-ast value-ast))))))

(defmethod iaw:walk-ast-node :around
    ((client split-setq-client) (ast ico:setq-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (split-setq-helper ast))

(defun split-setq (ast)
  (let ((client (make-instance 'split-setq-client)))
    (iaw:walk-ast client ast)))
