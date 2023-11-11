(cl:in-package #:iconoclast-ast-transformations)

;;;; This function turns an AST representing an FLET form into an AST
;;;; representing a LABELS form.  We can do that with no addtional
;;;; work because all the references to functions have already been
;;;; resolved in the FLET AST, so no capture is possible.

(defun flet-to-labels (flet-ast)
  (change-class flet-ast 'ico:labels-ast))

(defclass flet-to-labels-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client flet-to-labels-client) (ast ico:flet-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (flet-to-labels ast))

(defun flet-to-labels-everywhere (ast)
  (let ((client (make-instance 'flet-to-labels-client)))
    (iaw:walk-ast client ast)))
