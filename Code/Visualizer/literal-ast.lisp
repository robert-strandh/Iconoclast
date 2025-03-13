(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:literal-ast))
  (let* ((name (format nil "~s" (ico:literal ast)))
         (height 20))
    (draw-ast ast name)
    (+ height 10)))
