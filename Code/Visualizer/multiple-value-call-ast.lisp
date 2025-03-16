(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:multiple-value-call-ast))
  (draw-ast ast "multiple-value-call")
  (with-indentation (40)
    (display-ast (ico:function-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
