(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:variable-binding-ast))
  (let* ((name "binding"))
    (draw-ast ast name)
    (with-child-asts (10)
      (display-ast (ico:variable-name-ast ast))
      (display-ast (ico:form-ast ast)))))
