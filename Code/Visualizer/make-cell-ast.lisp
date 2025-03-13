(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:make-cell-ast))
  (let* ((name "make-cell")
         (width (+ (string-width name) 10))
         (height 20))
    (draw-ast ast width height name)
    (with-child-asts (height 20)
      (display-ast (ico:form-ast ast)))))
