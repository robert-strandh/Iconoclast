(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:make-cell-ast))
  (let* ((name "make-cell"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:form-ast ast)))))
