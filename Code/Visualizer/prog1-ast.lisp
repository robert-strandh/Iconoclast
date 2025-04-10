(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:prog1-ast))
  (draw-ast ast "prog1")
  (with-indentation (40)
    (display-ast (ico:first-form-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
