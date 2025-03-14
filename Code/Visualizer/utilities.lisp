(cl:in-package #:iconoclast-visualizer)

(defmacro with-child-asts ((delta-vpos delta-hpos) &body body)
  (let ((delta-hpos-variable (gensym))
        (vpos-variable (gensym)))
    `(let* ((,delta-hpos-variable ,delta-hpos)
            (,vpos-variable ,delta-vpos))
       ,@(loop for form in body
               collect `(clim:with-translation
                            (*pane* ,delta-hpos-variable 0)
                          ,form))
       0)))

(defun string-width (string)
  (clim:stream-string-width *pane* string))
