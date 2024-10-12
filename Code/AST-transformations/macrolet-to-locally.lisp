(cl:in-package #:iconoclast-ast-transformations)

;;; This function turns an AST representing a MACROLET form into an
;;; AST representing a LOCALLY form.  MACROLET has already been used
;;; in order to expand local macros in the body forms, so the
;;; MACROLET-AST serves no purpose.

;;; In this version, we do not take into account the possibility that
;;; the declarations might refer to the macro functions.

(defclass macrolet-to-locally-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client macrolet-to-locally-client) (ast ico:macrolet-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (change-class ast 'ico:locally-ast))

(defun macrolet-to-locally (ast)
  (let ((client (make-instance 'macrolet-to-locally-client)))
    (iaw:walk-ast client ast)))
