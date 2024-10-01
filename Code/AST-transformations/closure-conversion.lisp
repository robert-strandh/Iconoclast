(cl:in-package #:iconoclast-ast-transformations)

;;; This file will contain code for closure conversion.
;;;
;;; We compute ownership of definitions and references of lexical
;;; variables and local functions.  When a definition and a reference
;;; of some lexical variable or local function have different
;;; ownerships, we have a closed-over variable.
;;;
;;; We compute a tree of functions.  The tree reflects nesting.  The
;;; tree contains nodes, and each node contains the local function
;;; represented by that node, and a list of child nodes.  We also
;;; maintain a hash table mapping local functions to tree nodes.
;;;
;;; We start by doing assignment conversion where required.  To begin
;;; with, we might be conservative and do assignment conversion
;;; whenever a shared variable is assigned to.  Assignment conversion
;;; consists of introducing a new AST MAKE-CELL-AST that has slot
;;; containing a VARIABLE-REFERENCE-AST, say for variable V, and it
;;; has a cell as its value.  A LET-TEMPORARY-AST can be used to
;;; introduce a new lexical variable, say W, holding the cell.  The
;;; MAKE-CELL-AST and the LET-TEMPORARY-AST are introduced in the
;;; function that owns the VARIABLE-DEFINITION-AST for V.  Any
;;; SETQ-AST (we assume a transformation that makes SETQ-AST have a
;;; single pair) that with a VARIABLE-DEFINITION-AST for V as its
;;; VARIABLE-AST is replaced by a CELL-WRITE-AST that has slots for
;;; the VARIABLE-DEFINITION-AST for W and the original FORM-AST of the
;;; SETQ-AST.  Remaining VARIABLE-REFERENCE-ASTs for V are then
;;; replaced by new ASTs of type CELL-READ-AST, with a slot for a
;;; VARIABLE-REFERENCE-AST for W.
;;;
;;; The technique described in the previous paragraph is often very
;;; conservative.  We need to establish a more precise rule for when
;;; and where cells need to be introduced.
;;;
;;; After assignment conversion, no shared variable is assigned to.
;;;
;;; For each shared variable, we have the function that defines it,
;;; functions that references it, and perhaps some intermediate
;;; functions that neither define nor reference it.
