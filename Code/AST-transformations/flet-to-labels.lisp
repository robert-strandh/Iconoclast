(cl:in-package #:iconoclast-ast-transformations)

;;;; This function turns an AST representing an FLET form into an AST
;;;; representing a LABELS form.  We can do that with no addtional
;;;; work because all the references to functions have already been
;;;; resolved in the FLET AST, so no capture is possible.

(defclass flet-to-labels-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client flet-to-labels-client) (ast ico:flet-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (change-class ast 'ico:labels-ast))

(defun flet-to-labels (ast)
  (let ((client (make-instance 'flet-to-ast-client)))
    (iaw:walk-ast client ast)))
