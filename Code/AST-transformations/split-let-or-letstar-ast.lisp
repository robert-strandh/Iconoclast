(cl:in-package #:iconoclast-ast-transformations)

(defclass split-let-or-letstar-client (client) ())

(defun split-let-or-let-star-ast-helper (ast)
  nil)

(defmethod iaw:walk-ast-node :around
    ((client split-let-or-letstar-client) (ast ico:let-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (split-let-or-let-star-ast-helper ast))

(defmethod iaw:walk-ast-node :around
    ((client split-let-or-letstar-client) (ast ico:let*-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (split-let-or-let-star-ast-helper ast))

(defun split-let-or-letstar-ast (ast)
  (let ((client (make-instance 'split-let-or-letstar-client)))
    (iaw:walk-ast client ast)))
