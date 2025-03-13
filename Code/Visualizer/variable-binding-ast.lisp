(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:variable-binding-ast))
  (let* ((name "binding")
         (width (+ (string-width name) 10))
         (height 20))
    (draw-ast ast width height name)
    (with-child-asts (20 10)
      (display-ast (ico:variable-name-ast ast))
      (display-ast (ico:form-ast ast)))))

(defmethod display-ast* ((ast ico:variable-binding-ast) pane hpos vpos)
  (let* ((name "binding")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:variable-name-ast ast) pane
                          (+ hpos width 10)
                          child-vpos))
      (setf child-vpos
            (display-ast* (ico:form-ast ast) pane
                          (+ hpos width 10)
                          child-vpos))
      child-vpos)))
