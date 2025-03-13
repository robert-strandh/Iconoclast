(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:name-ast))
  (let* ((name (format nil "~a" (ico:name ast)))
         (height 20))
    (draw-ast ast name)
    (+ height 10)))

(defmethod display-ast ((ast ico:variable-definition-ast))
  (let* ((name (format nil "Def: ~a" (ico:name ast)))
         (height 20))
    (draw-ast ast name)
    (+ height 10)))

(defmethod display-ast ((ast ico:variable-reference-ast))
  (let* ((name (format nil "Ref: ~a" (ico:name ast)))
         (height 20))
    (draw-ast ast name)
    (+ height 10)))

(defmethod display-ast* ((ast ico:name-ast) pane hpos vpos)
  (let* ((name (format nil "~a" (ico:name ast)))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (+ vpos height 10)))

(defmethod display-ast* ((ast ico:variable-definition-ast) pane hpos vpos)
  (let* ((name (format nil "Def: ~a" (ico:name ast)))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (+ vpos height 10)))

(defmethod display-ast* ((ast ico:variable-reference-ast) pane hpos vpos)
  (let* ((name (format nil "Ref: ~a" (ico:name ast)))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast* ast pane hpos vpos width height name)
    (+ vpos height 10)))
