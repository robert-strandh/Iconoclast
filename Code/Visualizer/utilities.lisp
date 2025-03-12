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
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-asts* (ico:name-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))

(defmacro with-child-asts ((delta-vpos delta-hpos) &body body)
  (let ((delta-hpos-variable (gensym))
        (vpos-variable (gensym))
        (max-hpos-variable (gensym)))
    `(let* ((,delta-hpos-variable ,delta-hpos)
            (,vpos-variable ,delta-vpos)
            (,max-hpos-variable ,delta-hpos-variable))
       ,@(loop for form in body
               collect `(clim:with-translation
                            (*pane* ,delta-hpos-variable ,vpos-variable)
                          (multiple-value-bind (v h)
                              ,form
                            (incf ,vpos-variable v)
                            (setf ,max-hpos-variable
                                  (max ,max-hpos-variable h)))))
       (values ,vpos-variable ,max-hpos-variable))))

