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

(defun aa ()
  (labels ((ff (y)
             (labels ((gg (x)
                        (if (zerop x) y (* x (gg (1- x))))))
               (gg y))))
    (loop for i from 0 to 5
          collect (ff i))))

;;; (aa) => (0 1 4 18 96 600)

(defun bb (y)
  (labels ((gg (x)
             (if (zerop x) y (* x (gg (1- x))))))
    (loop for i from 0 to 5
          do (setq y i)
          collect (gg y))))

;;; (bb nil) => (0 1 4 18 96 600)

(defun cc ()
  (labels ((ff (y)
             (labels ((gg (x)
                        (if (zerop x) y (* x (gg (1- x))))))
               (lambda () (gg y)))))
    (loop for i from 0 to 5
          collect (ff i))))

;;; (mapcar #'funcall (cc) => (0 1 4 18 96 600)

(defun dd (y)
  (labels ((gg (x)
             (if (zerop x) y (* x (gg (1- x))))))
    (loop for i from 0 to 5
          do (setq y i)
          collect (lambda () (gg y)))))

;;; (mapcar #'funcall (dd nil) => (600 600 600 600 600 600)

; LocalWords:  inlining
