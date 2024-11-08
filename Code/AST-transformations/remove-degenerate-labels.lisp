(cl:in-package #:iconoclast-ast-transformations)

(defclass remove-degenerate-labels-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client remove-degenerate-labels-client)
     (ast ico:labels-ast))
  (call-next-method)
  (let ((binding-asts (ico:binding-asts ast))
        (declaration-asts (ico:declaration-asts ast))
        (form-asts (ico:form-asts ast)))
    (if (null binding-asts)
        (if (null declaration-asts)
            (if (= 1 (length form-asts))
                ;; Then we simply replace the entire LABELS-AST with
                ;; the one form AST.
                (first form-asts)
                ;; Otherwise, we turn the LABELS-AST into a PROGN-AST.
                (progn (change-class ast 'ico:progn-ast)
                       ast))
            (progn (change-class ast 'ico:locally-ast)
                   ast))
        ast)))

(defun remove-degenerate-labels (ast)
  (let ((client (make-instance 'remove-degenerate-labels-client)))
    (iaw:walk-ast client ast))
  ast)
