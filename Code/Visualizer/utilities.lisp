(cl:in-package #:iconoclast-visualizer)

;;; Display a list of ASTS to be aligned in a column.
(defun display-asts* (asts pane hpos vpos)
  (let ((child-vpos vpos))
    (loop for ast in asts
          do (setf child-vpos (display-ast* ast pane hpos child-vpos)))
    child-vpos))

(defun display-simple-declaration-ast (ast name pane hpos vpos)
  (let* ((width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts* (ico:name-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))

(defmacro with-child-asts ((delta-vpos delta-hpos) &body body)
  (let ((delta-hpos-var (gensym)))
    `(let* ((,delta-hpos-var ,delta-hpos)
            (vpos ,delta-vpos)
            (max-hpos ,delta-hpos-var))
       ,@(loop for form in body
               collect `(clim:with-translation
                            (*pane* ,delta-hpos-var vpos )
                          (multiple-value-bind (v h)
                              ,form
                            (incf vpos v)
                            (setf max-hpos (max max-hpos h))))))))
