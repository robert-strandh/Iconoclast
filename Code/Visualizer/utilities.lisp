(cl:in-package #:iconoclast-visualizer)

;;; Display a list of ASTS to be aligned in a column.
(defun display-asts (asts pane hpos vpos)
  (let ((child-vpos vpos))
    (loop for ast in asts
          do (incf child-vpos (display-ast* ast pane hpos child-vpos)))
    child-vpos))
