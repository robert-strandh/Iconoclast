(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:let-temporary-ast))
  (let* ((name "let-temporary"))
    (draw-ast ast name)
    (with-child-asts (20)
      (display-ast (ico:binding-ast ast))
      (display-asts (ico:declaration-asts ast))
      (display-asts (ico:form-asts ast)))))
