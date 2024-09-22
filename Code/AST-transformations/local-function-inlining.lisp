(cl:in-package #:iconoclast-ast-transformations)

;;; This file will contain code for inlining local functions defined
;;; by LABELS-ASTs.
;;;
;;; For a function to be a candidate for inlining, we use the
;;; following criteria:
;;;
;;;   * It must not "escape".  We approximate this criterion by
;;;     requiring the name of the function to appear only in the
;;;     operator position of an application.
;;;
;;;   * It must not be recursive, directly or indirectly.
;;;
;;;   * It must be called only once.  We might relax this criterion
;;;     later when we have a better idea of the increased code size
;;;     that inlining would create.
;;;
;;;   * It must be called from the same function that defines it.  The
;;;     reason for this criterion is that if it closes over some
;;;     variable, and it is called by some inner function, then more
;;;     functions might close over the variable.  We might relax this
;;;     criterion later if the candidate for inlining does not close
;;;     over any variables.

; LocalWords:  inlining
