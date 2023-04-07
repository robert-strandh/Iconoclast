(cl:in-package #:iconoclast-visualizer)

(defun display-let-or-let* (name ast pane hpos vpos)
  (let* ((width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (let ((child-vpos vpos))
      (loop for variable-binding-ast in (ico:variable-binding-asts ast)
            do (setf child-vpos
                     (+ (display-ast* variable-binding-ast pane
                                      (+ hpos width 20)
                                      child-vpos)
                        10)))
      (loop for declaration-ast in (ico:declaration-asts ast)
            do (setf child-vpos
                     (+ (display-ast* declaration-ast pane
                                      (+ hpos width 15)
                                      child-vpos)
                        10)))
      (loop for form-ast in (ico:form-asts ast)
            do (setf child-vpos
                     (+ (display-ast* form-ast pane
                                      (+ hpos width 10)
                                      child-vpos)
                        10)))
      (+ child-vpos height))))

(defmethod display-ast* ((ast ico:let-ast) pane hpos vpos)
  (display-let-or-let* "let" ast pane hpos vpos))

(defmethod display-ast* ((ast ico:let*-ast) pane hpos vpos)
  (display-let-or-let* "let*" ast pane hpos vpos))
