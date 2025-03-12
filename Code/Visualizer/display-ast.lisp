(cl:in-package #:iconoclast-visualizer)

(defvar *pane*)

(defgeneric display-ast (ast))

(defgeneric display-ast* (ast pane hpos vpos))

(defgeneric selected-asts (frame))

;;; Default method for ASTs that have not yet been dealt with in
;;; specific methods.
(defmethod display-ast (ast)
  (let* ((name (format nil "~a" (class-name (class-of ast))))
         (width (+ (clim:stream-string-width *pane* name) 10))
         (height 20)
         (slot-designators (ico:slot-designators ast)))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos (+ height 10))
          (max-hpos 0))
      (loop for (delta-hpos slot-reader) in (layout ast)
            for slot-designator
              = (find slot-reader slot-designators :key #'second)
            for slot-value = (funcall slot-reader ast)
            do (ecase (first slot-designator)
                 (1
                  (clim:with-translation (*pane* delta-hpos child-vpos)
                    (multiple-value-bind (height width)
                        (display-ast slot-value)
                      (incf child-vpos height)
                      (setf max-hpos (max max-hpos width)))))
                 (*
                  (clim:with-translation (*pane* delta-hpos child-vpos)
                    (multiple-value-bind (height width)
                        (display-asts slot-value)
                      (incf child-vpos height)
                      (setf max-hpos (max max-hpos width)))))
                 (iconoclast:?
                  (unless (null slot-value)
                    (clim:with-translation (*pane* delta-hpos child-vpos)
                      (multiple-value-bind (height width)
                          (display-ast slot-value)
                      (incf child-vpos height)
                      (setf max-hpos (max max-hpos width))))))))
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
          (draw-ast ast pane hpos vpos width height name))
        (draw-ast ast pane hpos vpos width height name))
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

(defmethod display-ast* :around (ast pane hpos vpos)
  (multiple-value-bind (child-vpos max-hpos)
      (call-next-method)
    (if (null max-hpos)
        (clim:draw-line*
         pane hpos vpos hpos (- child-vpos 2))
        (clim:draw-rectangle*
         pane hpos vpos max-hpos (- child-vpos 2)))
    (values child-vpos max-hpos)))

(defun draw-ast (ast pane hpos vpos width height text)
  (clim:with-output-as-presentation (pane ast 'ico:ast)
    (clim:draw-rectangle* pane
                          hpos vpos
                          (+ hpos width) (+ vpos height)
                          :filled nil)
    (clim:draw-text* pane text
                     (+ hpos (/ width 2)) (+ vpos (/ height 2))
                     :align-x :center :align-y :center)))
