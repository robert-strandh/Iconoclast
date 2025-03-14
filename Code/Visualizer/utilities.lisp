(cl:in-package #:iconoclast-visualizer)

(defmacro with-child-asts ((delta-hpos) &body body)
  `(clim:with-translation (*pane* ,delta-hpos 0)
     ,@body))

(defun string-width (string)
  (clim:stream-string-width *pane* string))
