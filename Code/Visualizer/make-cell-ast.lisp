(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:make-cell-ast))
  (let* ((name "make-cell")
         (height 20))
    (draw-ast ast name)
    (with-child-asts (height 20)
      (display-ast (ico:form-ast ast)))))
