(cl:in-package #:iconoclast-visualizer)

(defgeneric display-ast* (ast pane hpos vpos))

(defun draw-ast (pane hpos vpos width height text)
  (clim:draw-rectangle* pane
                        hpos vpos
                        (+ hpos width) (+ vpos height)
                        :filled nil)
  (clim:draw-text* pane text
                   (+ hpos (/ width 2)) (+ vpos (/ height 2))
                   :align-x :center :align-y :center))
