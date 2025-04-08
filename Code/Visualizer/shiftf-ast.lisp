(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:shiftf-ast))
  (draw-ast ast "shiftf")
  (with-indentation (30)
    (display-ast (ico:value-ast ast)))
  (with-indentation (20)
    (display-asts (ico:place-asts ast))))
