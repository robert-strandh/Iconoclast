(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:block-with-variable-ast))
  (let* ((name "block-with-variable"))
    (draw-ast ast name)
    (with-child-asts (20)
      (display-ast (ico:variable-definition-ast ast))
      (display-asts (ico:form-asts ast)))))
