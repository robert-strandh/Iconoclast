(cl:in-package #:iconoclast-ast-transformations)

;;; This file will contain code for closure conversion.
;;;
;;; When closure conversion is computed, we have already done
;;; assignment conversion where required.  Assignment conversion is
;;; done by the ASSIGNMENT-CONVERSION function.  We have also
;;; converted all references to local functions, TAGBODY tags, and
;;; BLOCKs to variable references.  So we just need to handle variable
;;; references with no assignments.
;;;
;;; We make use of ownership of definitions and references of lexical
;;; variables.  When a definition and a reference of some lexical
;;; variable have different ownerships, we have a closed-over
;;; variable.  We also make use of a tree of functions.  The tree
;;; reflects nesting.  Ownership and the function tree are computed by
;;; COMPUTE-AST-INFO and
;;;
;;; We maintain a list, say L, of entries, where each entry represents
;;; a local function with a non-NIL static environment.  Each entry
;;; contains a LOCAL-FUNCTION-AST, the associated LET-TEMPORARY-AST
;;; extracting the static environment and the
;;; SET-STATIC-ENVIRONMENT-AST setting the static environment.
;;; Initially, that list is empty.
;;;
;;; We handle each shared variable separately.  For each shared
;;; variable, we have the function that defines it, functions that
;;; references it, and perhaps some intermediate functions that
;;; neither define nor reference it.  We consider the list of entries,
;;; say E, where an entry is either a variable definition or a
;;; variable reference.
;;;
;;;   1. If every entry in E has the same owner, stop.
;;;
;;;   2. Consider the owners F1, F2, ... Fn of each entry.  Use the
;;;      function tree to find the innermost function Fi of those
;;;      owners.
;;;
;;;   3. Extract all entries (which are necessarily variable reference
;;;      entries) with Fi as their owner, say R1, R2, ... Rk, and
;;;      remove them from E.
;;;
;;;   4. If Fi is not in L then wrap the body FORM-ASTs of Fi in a new
;;;      LET-TEMPORARY-AST with a STATIC-ENVIRONMENT-AST as the
;;;      FORM-AST and a new VARIABLE-DEFINITION-AST, say S.  Add a
;;;      SET-STATIC-ENVIRONMENT-AST to the beginning of the body of
;;;      the LABELS-AST that defines Fi.  Add Fi to L with the
;;;      associated LET-TEMPORARY-AST and SET-STATIC-ENVIRONMENT-AST.
;;;      Call the LET-TEMPORARY-AST associated with Fi LFi and the
;;;      SET-STATIC-ENVIRONMENT-AST associated with Fi SFi
;;;
;;;   5. Let Fj be the parent of Fi in the function tree.  Create a
;;;      new VARIABLE-REFERENCE-AST, say R, with Fj as the owner, and
;;;      add it to E.  Add R to SFi.
;;;
;;;   6. Create a new VARIABLE-DEFINITION-AST, say D.  Wrap the body
;;;      FORM-ASTs of LFi in a new LET-TEMPORARY-AST.  The new
;;;      LET-TEMPORARY-AST contains a READ-STATIC-ENVIRONMENT-AST as
;;;      the FORM-AST and D as the VARIABLE-DEFINITION-AST.  Link up D
;;;      and R1, R2, ... Rk.
;;;
;;;   7. Go to 1.
