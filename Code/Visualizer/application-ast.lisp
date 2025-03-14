(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:application-ast))
  (draw-ast ast "application")
  (with-indentation (40)
    (display-ast (ico:function-name-ast ast)))
  (with-indentation (20)
    (display-asts (ico:argument-asts ast))))
