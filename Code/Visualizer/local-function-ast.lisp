(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:local-function-ast))
  (let* ((name "local-function")
         (height 20))
    (draw-ast ast name)
    (with-child-asts (height 20)
      (display-ast (ico:name-ast ast))
      (display-ast (ico:lambda-list-ast ast))
      (display-asts (ico:declaration-asts ast))
      (display-ast (ico:documentation-ast ast))
      (display-asts (ico:form-asts ast)))))
