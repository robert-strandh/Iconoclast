(cl:in-package #:iconoclast-visualizer)

(defvar *pane*)

(defgeneric display-ast (ast))

;;; Display a list of ASTS to be aligned in a column.
(defun display-asts (asts)
  (let ((child-vpos 0))
    (loop for ast in asts
          do (clim:with-translation (*pane* 0 child-vpos)
               (display-ast ast)))
    child-vpos))

(defgeneric selected-asts (frame))

;;; Default method for ASTs that have not yet been dealt with in
;;; specific methods.
(defmethod display-ast (ast)
  (let* ((name (format nil "~a" (class-name (class-of ast))))
         (height 20)
         (slot-designators (ico:slot-designators ast)))
    (draw-ast ast name)
    (let ((child-vpos (+ height 10)))
      (loop for (delta-hpos slot-reader) in (layout ast)
            for slot-designator
              = (find slot-reader slot-designators :key #'second)
            for slot-value = (funcall slot-reader ast)
            do (ecase (first slot-designator)
                 (1
                  (clim:with-translation (*pane* delta-hpos child-vpos)
                    (display-ast slot-value)))
                 (*
                  (clim:with-translation (*pane* delta-hpos child-vpos)
                    (display-asts slot-value)))
                 (iconoclast:?
                  (unless (null slot-value)
                    (clim:with-translation (*pane* delta-hpos child-vpos)
                      (display-ast slot-value))))))
      child-vpos)))

(defmethod display-ast :around (ast)
  (unless (null ast)
    (clim:surrounding-output-with-border (*pane*)
      (call-next-method))))

;;; Things are a bit complicated, because the STREAM-CURSOR-POSITION
;;; is given in the sheet coordinate system, but we are drawing things
;;; with a transformed user coordinate system.  We want to preserve
;;; the vertical component of the STREAM-CURSOR-POSITION, but we want
;;; to set the horizontal component to 0 in the user coordinate system.
(defun draw-ast (ast text)
  (let* ((cursor-y (nth-value 1 (clim:stream-cursor-position  *pane*)))
         (transformation (clim:medium-transformation  *pane*))
         (sheet-x (clim:transform-position transformation 0 0)))
    (setf (clim:stream-cursor-position  *pane*)
          (values sheet-x (+ cursor-y 5))))
  (clim:with-output-as-presentation (*pane* ast 'ico:ast)
    (format *pane* "~a~%" text)))
