(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:eval-when-ast))
  (draw-ast ast "eval-when")
  (with-indentation (40)
    (display-asts (ico:situation-asts ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
