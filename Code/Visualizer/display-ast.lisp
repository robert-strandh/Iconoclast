(cl:in-package #:iconoclast-visualizer)

(defvar *pane*)

(defgeneric display-ast (ast))

;;; Display a list of ASTS to be aligned in a column.
(defun display-asts (asts)
  (let ((child-vpos 0))
    (loop for ast in asts
          do (clim:with-translation (*pane* 0 child-vpos)
               (let ((height (display-ast ast)))
                 (incf child-vpos height))))
    child-vpos))

(defgeneric display-ast* (ast pane hpos vpos))

(defgeneric selected-asts (frame))

;;; Default method for ASTs that have not yet been dealt with in
;;; specific methods.
(defmethod display-ast (ast)
  (let* ((name (format nil "~a" (class-name (class-of ast))))
         (width (+ (clim:stream-string-width *pane* name) 10))
         (height 20)
         (slot-designators (ico:slot-designators ast)))
    (draw-ast ast width height name)
    (let ((child-vpos (+ height 10)))
      (loop for (delta-hpos slot-reader) in (layout ast)
            for slot-designator
              = (find slot-reader slot-designators :key #'second)
            for slot-value = (funcall slot-reader ast)
            do (ecase (first slot-designator)
                 (1
                  (clim:with-translation (*pane* delta-hpos child-vpos)
                    (let ((height (display-ast slot-value)))
                      (incf child-vpos height))))
                 (*
                  (clim:with-translation (*pane* delta-hpos child-vpos)
                    (let ((height (display-asts slot-value)))
                      (incf child-vpos height))))
                 (iconoclast:?
                  (unless (null slot-value)
                    (clim:with-translation (*pane* delta-hpos child-vpos)
                      (let ((height (display-ast slot-value)))
                        (incf child-vpos height)))))))
      child-vpos)))

;;; Default method for ASTs that have not yet been dealt with in
;;; specific methods.
(defmethod display-ast* (ast pane hpos vpos)
  (let* ((name (format nil "~a" (class-name (class-of ast))))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20)
         (slot-designators (ico:slot-designators ast)))
    (if (member ast (selected-asts clim:*application-frame*))
        (clim:with-drawing-options (pane :ink clim:+red+)
          (draw-ast* ast pane hpos vpos width height name))
        (draw-ast* ast pane hpos vpos width height name))
    (let ((child-vpos (+ vpos height 10)))
      (loop for (delta-hpos slot-reader) in (layout ast)
            for slot-designator
              = (find slot-reader slot-designators :key #'second)
            for slot-value = (funcall slot-reader ast)
            do (ecase (first slot-designator)
                 (1
                  (setq child-vpos
                        (display-ast* slot-value
                                      pane (+ hpos delta-hpos) child-vpos)))
                 (*
                  (setq child-vpos
                        (display-asts* slot-value
                                       pane (+ hpos delta-hpos) child-vpos)))
                 (iconoclast:?
                  (unless (null slot-value)
                    (setq child-vpos
                          (display-ast* slot-value
                                        pane
                                        (+ hpos delta-hpos)
                                        child-vpos))))))
      child-vpos)))

(defmethod display-ast :around (ast)
  (if (null ast)
      0
      (let (result)
        (clim:surrounding-output-with-border (*pane*)
          (let ((height (call-next-method)))
            (setf result height)))
        (multiple-value-bind (x y) (clim:stream-cursor-position *pane*)
          (format *trace-output*
                  "Cursor position: ~s ~s ~s~%"
                  (class-name (class-of ast)) (float x) (float y)))
        result)))

(defmethod display-ast* :around (ast pane hpos vpos)
  (multiple-value-bind (child-vpos max-hpos)
      (call-next-method)
    (if (null max-hpos)
        (clim:draw-line*
         pane hpos vpos hpos (- child-vpos 2))
        (clim:draw-rectangle*
         pane hpos vpos max-hpos (- child-vpos 2)))
    (values child-vpos max-hpos)))

(defun draw-ast* (ast pane hpos vpos width height text)
  (clim:with-output-as-presentation (pane ast 'ico:ast)
    (clim:draw-rectangle* pane
                          hpos vpos
                          (+ hpos width) (+ vpos height)
                          :filled nil)
    (clim:draw-text* pane text
                     (+ hpos (/ width 2)) (+ vpos (/ height 2))
                     :align-x :center :align-y :center)))

(defun draw-ast (ast width height text)
  (clim:with-output-as-presentation (*pane* ast 'ico:ast)
    ;; (clim:draw-rectangle* *pane* 0 0 width height :filled nil)
    (clim:draw-text* *pane* text (/ width 2) (/ height 2)
                     :align-x :center :align-y :center)))
