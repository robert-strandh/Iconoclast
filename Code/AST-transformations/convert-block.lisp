(cl:in-package #:iconoclast-ast-transformations)

;;;; This file contains code that converts BLOCK-AST into
;;;; BLOCK-WITH-VARIABLE-AST and RETURN-FROM-AST into
;;;; RETURN-FROM-WITH-VARIABLE-AST.  BLOCK-AST and RETURN-FROM-AST are
;;;; linked by the block name.  the BLOCK-AST contains a
;;;; BLOCK-NAME-DEFINITION-AST that contains a list of
;;;; BLOCK-NAME-REFERENCE-ASTs, and the RETURN-FROM-ASTs each contains
;;;; a BLOCK-NAME-REFERENCE-AST which contains the
;;;; BLOCK-NAME-DEFINITION-AST.  So the strategy here is that we
;;;; maintain a mapping from BLOCK-NAME-DEFINITION-ASTs to
;;;; VARIABLE-DEFINITION-ASTs representing the introduced variables.
;;;; When we encounter a RETURN-FROM-AST, we consult the mapping and
;;;; we add a VARIABLE-REFERENCE-AST to the list in the
;;;; VARIABLE-DEFINITION-AST and we change the class of the
;;;; RETURN-FROM-AST to a RETURN-FROM-WITH-VARIABLE-AST.  On the way
;;;; back up the AST tree, we then change the class of the BLOCK-AST
;;;; to BLOCK-WITH-VARIABLE-AST.

(defvar *name-to-variable-mapping*)

(defclass convert-block-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client convert-block-client) (ast ico:block-ast))
  (let* ((name-ast (ico:name-ast ast))
         (name (ico:name name-ast))
         (variable-definition-ast
           (make-instance 'ico:variable-definition-ast
             :name name))
         (*name-to-variable-mapping*
           (acons name-ast variable-definition-ast
                  *name-to-variable-mapping*)))
    (call-next-method)
    (change-class ast 'ico:block-with-variable-ast
                  :variable-definition-ast variable-definition-ast))
  ast)

(defmethod iaw:walk-ast-node :around
    ((client convert-block-client) (ast ico:return-from-ast))
  (let* (;; We are linked to the BLOCK-AST through the NAME-AST of
         ;; this AST, so access the NAME-AST.
         (name-ast (ico:name-ast ast))
         (definition-ast (ico:block-name-definition-ast name-ast))
         ;; We need a name for the new VARIABLE-REFERENCE-AST, so get
         ;; it from the BLOCK-NAME-DEFINITION-AST.
         (name (ico:name definition-ast))
         (variable-definition-ast
           (cdr (assoc definition-ast *name-to-variable-mapping*)))
         (variable-reference-ast
           (make-instance 'ico:variable-reference-ast
             :name name
             :definition-ast variable-definition-ast)))
    (reinitialize-instance variable-definition-ast
      :reference-asts
      (cons variable-reference-ast
            (ico:reference-asts variable-definition-ast)))
    (change-class ast 'ico:return-from-with-variable-ast
                  :variable-reference-ast variable-reference-ast))
  ast)

(defun convert-block (ast)
  (let ((client (make-instance 'convert-block-client))
        (*name-to-variable-mapping* '()))
    (iaw:walk-ast client ast)))
