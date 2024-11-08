(cl:in-package #:iconoclast-ast-transformations)

(defclass remove-unused-blocks-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client remove-unused-blocks-client)
     (ast ico:block-with-variable-ast))
  (call-next-method)
  (let* ((definition-ast (ico:variable-definition-ast ast))
         (reference-asts (ico:reference-asts definition-ast)))
    (if (null reference-asts)
        (let ((form-asts (ico:form-asts ast)))
          (if (= 1 (length form-asts))
              ;; Then we simply replace the entire
              ;; BLOCK-WITH-VARIABLE-AST with the one form AST.
              (first form-asts)
              ;; Otherwise, we turn the BLOCK-WITH-VARIABLE-AST into a
              ;; PROGN-AST.
              (progn (change-class ast 'ico:progn-ast)
                     ast)))
        ;; This BLOCK-WITH-VARIABLE-AST has at least one
        ;; RETURN-FROM-WITH-VARIABLE-AST associated with it, so we
        ;; keep it.
        ast)))

(defun remove-unused-blocks (ast)
  (let ((client (make-instance 'remove-unused-blocks-client)))
    (iaw:walk-ast client ast))
  ast)
