(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:set-static-environment-ast))
  (draw-ast ast "set-static-environment")
  (with-indentation (40)
    (display-ast (ico:function-reference-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
