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
;;; For each closed-over variable, we have the function that defines
;;; it, functions that references it, and perhaps some intermediate
;;; functions that neither define nor reference it.  There are two
;;; cases, depending on whether the variable is assigned to, or just
;;; referenced.  If it is assigned to, then the function that defines
;;; the variable must create a cell and put the value in that cell.
;;; In every function having a child function that references the
;;; variable the cell must be included in the static environment of
;;; every such child function.  Every using function and every
;;; intermediate function must reference its static environment and
;;; store the cell i a new lexical variable.  References to the
;;; variable must be replaced by a new AST type READ-CELL-AST, and
;;; assignments to the variable must be replaced by a new AST type
;;; WRITE-CELL-AST.
;;;
;;; If the closed-over variable is never assigned to, no cell needs to
;;; be introduced.
