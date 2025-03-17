(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:unwind-protect-ast))
  (draw-ast ast "unwind-protect")
  (with-indentation (30)
    (display-ast (ico:protected-form-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
