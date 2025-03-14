(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:block-ast))
  (let* ((name "block"))
    (draw-ast ast name)
    (with-child-asts (20)
      (display-ast (ico:name-ast ast))
      (display-asts (ico:form-asts ast)))))
