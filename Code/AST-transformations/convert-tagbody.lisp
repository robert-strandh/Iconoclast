(cl:in-package #:iconoclast-ast-transformations)

;;; This file contains code that converts TAGBODY-AST into
;;; TAGBODY-WITH-VARIABLE-AST and GO-AST into GO-WITH-VARIABLE-AST.
;;; TAGBODY-AST and GO-AST are linked in that the GO-AST contains a
;;; TAG-REFERENCE-AST and the TAG-REFERENCE-AST contains the
;;; TAG-DEFINITION-AST of the SEGMENT-AST with the tag in question.
;;; Then the TAG-DEFINITION-AST contains the SEGMENT-AST and the
;;; SEGMENT-AST contains the TAGBODY-AST.

(defvar *tagbody-to-variable-mapping*)

(defclass convert-tagbody-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client convert-tagbody-client) (ast ico:tagbody-ast))
  (let* ((variable-definition-ast
           (make-instance 'ico:variable-definition-ast
             :name nil))
         (*tagbody-to-variable-mapping*
           (acons ast variable-definition-ast
                  *tagbody-to-variable-mapping*)))
    (call-next-method)
    (change-class ast 'ico:tagbody-with-variable-ast
                  :variable-definition-ast variable-definition-ast))
  ast)

(defmethod iaw:walk-ast-node :around
    ((client convert-tagbody-client) (ast ico:go-ast))
  (let* ((tag-reference-ast (ico:tag-ast ast))
         (tag-definition-ast (ico:tag-definition-ast tag-reference-ast))
         (segment-ast (ico:segment-ast tag-definition-ast))
         (tagbody-ast (ico:tagbody-ast segment-ast))
         (variable-definition-ast
           (cdr (assoc tagbody-ast *tagbody-to-variable-mapping*)))
         (variable-reference-ast
           (make-instance 'ico:variable-reference-ast
             :name nil
             :definition-ast variable-definition-ast))
         (segment-asts (ico:segment-asts tagbody-ast))
         (relevant-segment-asts
           (if (null (ico:tag-ast (first segment-asts)))
               (rest segment-asts)
               segment-asts))
         (index (position tag-definition-ast relevant-segment-asts
                          :test #'eq :key #'ico:tag-ast)))
    (reinitialize-instance variable-definition-ast
      :variable-reference-asts
      (cons variable-reference-ast
            (ico:variable-reference-asts variable-definition-ast)))
    (change-class ast 'ico:go-with-variable-ast
                  :variable-reference-ast variable-reference-ast
                  :index-ast (make-instance 'ico:literal-ast
                               :literal index)))
  ast)

(defun convert-tagbody (ast)
  (let ((client (make-instance 'convert-tagbody-client))
        (*tagbody-to-variable-mapping* '()))
    (iaw:walk-ast client ast)))
