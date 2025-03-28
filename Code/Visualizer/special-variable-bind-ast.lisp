(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:special-variable-binding-ast))
  (draw-ast ast "special-variable-bind")
  (with-indentation (40)
    (display-ast (ico:variable-name-ast ast)))
  (with-indentation (20)
    (display-ast (ico:form-ast ast))))

(defmethod display-ast ((ast ico:special-variable-bind-ast))
  (draw-ast ast "special-variable-bind")
  (with-indentation (40)
    (display-ast (ico:binding-ast ast)))
  (with-indentation (20)
    (display-asts (ico:form-asts ast))))
