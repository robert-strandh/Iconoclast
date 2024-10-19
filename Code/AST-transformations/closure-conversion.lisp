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
;;; We handle each shared variable separately.  For each shared
;;; variable, we have the function that defines it, functions that
;;; references it, and perhaps some intermediate functions that
;;; neither define nor reference it.  We consider the list of entries,
;;; where an entry is either a variable definition or a variable
;;; reference.
;;;
;;;   1. If every entry has the same owner, stop.
;;;
;;;   2. Consider the owners F1, F2, ... Fn of each entry.  Use the
;;;      function tree to find the innermost function Fi of those
;;;      owners.
;;;
;;;   3. Extract all entries (which are necessarily variable reference
;;;      entries) with Fi as their owner, say R1, R2, ... Rk, and
;;;      remove them from the original list.
;;;
;;;   4. If Fi is not in the list of function with a non-NIL static
;;;      environment, then add a LET-TEMPORARY-AST with a
;;;      STATIC-ENVIRONMENT-AST to the beginning of Fi.  Call the
;;;      variable definition introduced S.  Add a
;;;      SET-STATIC-ENVIRONMENT-AST to the beginning of the body of
;;;      the LABELS-AST that defines Fi.  Add Fi to the list of
;;;      functions with a non-NIL static environment.
;;;
;;;   5. Let Fj be parent of Fi in the function tree.  Create a new
;;;      VARIABLE-REFERENCE-AST, say R, with Fj as the owner, and add
;;;      it to the list of remaining entries.  Add R to the
;;;      SET-STATIC-ENVIRONMENT-AST just introduced.
;;;
;;;   6. Create a new VARIABLE-DEFINITION-AST, say D, Add a
;;;      LET-TEMPORARY-AST immediately as the first form of the
;;;      LET-TEMPORARY-AST that introduces the static environment.
;;;      Link up D and R1, R2, ... Rk.
