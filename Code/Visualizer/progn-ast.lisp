(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:progn-ast))
  (let* ((name "progn"))
    (draw-ast ast name)
    (with-indentation (10)
      (display-asts (ico:form-asts ast)))))
