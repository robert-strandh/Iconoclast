(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:locally-ast))
  (draw-ast ast "locally")
  (with-indentation (40)
    (display-asts (ico:declaration-asts ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
