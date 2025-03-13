(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:block-with-variable-ast))
  (let* ((name "block-with-variable")
         (width (+ (string-width name) 10))
         (height 20))
    (draw-ast ast name)
    (with-child-asts (20 20)
      (display-ast (ico:variable-definition-ast ast))
      (display-asts (ico:form-asts ast)))))

(defmethod display-ast* ((ast ico:block-with-variable-ast) pane hpos vpos)
  (let* ((name "block-with-variable")
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (setf child-vpos
            (display-ast* (ico:variable-definition-ast ast) pane
                          (+ hpos width 20)
                          child-vpos))
      (setf child-vpos
            (display-asts* (ico:form-asts ast)
                           pane (+ hpos width 10) child-vpos))
      child-vpos)))
