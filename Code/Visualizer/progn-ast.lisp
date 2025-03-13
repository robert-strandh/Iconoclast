(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:progn-ast))
  (let* ((name "progn")
         (height 20))
    (draw-ast ast name)
    (with-child-asts ((+ height 10) 10)
      (display-asts (ico:form-asts ast)))))
