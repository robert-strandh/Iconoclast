(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:defparameter-ast))
  (draw-ast ast "defparameter")
  (with-indentation (20)
    (display-ast (ico:variable-name-ast ast))
    (display-ast (ico:form-ast ast))))
