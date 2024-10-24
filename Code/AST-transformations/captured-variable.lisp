(cl:in-package #:iconoclast-ast-transformations)

;;; The code in this file is meant to check whether a variable is
;;; captured.  This definition assumes that the only construct that
;;; introduces a lexical variable is the local function of LABELS.

;;; Let V be a variable introduced by some function F, so that F is
;;; the owner of the VARIABLE-DEFINITION-AST corresponding to V is the
;;; LOCAL-FUNCTION-AST corresponding to F.  Let R be a
;;; VARIABLE-REFERENCE-AST referring to V, so that R is an element of
;;; the list VARIABLE-REFERENCE-ASTs of the VARIABLE-DEFINITION-AST,
;;; and let G be the LOCAL-FUNCTION-AST that is the owner of R.  Then,
;;; if any function in the function tree between G and F (excluding F)
;;; escapes, then V is captured.

;;; Given two instances of LOCAL-FUNCTION-AST F-AST and G-ast such
;;; that F-AST is an ancestor of G-AST in the function tree of some
;;; AST, return true if and only if some LOCAL-FUNCTION-AST in the
;;; path between G-AST and F-AST (excluding F-AST itself) escapes.
(defun some-function-escapes (f-ast g-ast ast-info)
  (loop for ast = g-ast then (function-parent-ast ast ast-info)
        until (eq ast f-ast)
          thereis (function-escapes-p ast ast-info)))

;;; Given a a VARIABLE-DEFINITION-AST and a VARIABLE-REFERENCE-AST of
;;; some variable, return true if and only if that particular
;;; VARIABLE-REFERENCE-AST escapes.
(defun variable-reference-escapes-p
    (variable-definition-ast variable-reference-ast ast-info)
  (let ((defining-owner
          (owner-ast variable-definition-ast ast-info))
        (referencing-owner
          (owner-ast variable-reference-ast ast-info)))
    (some-function-escapes defining-owner referencing-owner ast-info)))

;;; Given a a VARIABLE-DEFINITION-AST of some variable, return true if
;;; and only if the variable escapes.
(defun variable-escapes (variable-definition-ast ast-info)
  (loop for ast in (ico:reference-asts variable-definition-ast)
          thereis (variable-reference-escapes-p
                   variable-definition-ast ast ast-info)))

;;; Given a LAMBDA-LIST-AST with only required lexical parameters,
;;; return true if and only if any of the introduced variables
;;; escapes.
(defun some-variable-escapes (lambda-list-ast ast-info)
  (let ((required-section-ast (ico:required-section-ast lambda-list-ast)))
    (if (null required-section-ast)
        nil
        (loop for parameter-ast in (ico:parameter-asts required-section-ast)
              for name-ast = (ico:name-ast parameter-ast)
                thereis (variable-escapes name-ast ast-info)))))
