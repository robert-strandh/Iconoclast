(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:if-ast))
  (draw-ast ast "if")
  (with-indentation (40)
    (display-ast (ico:test-ast ast)))
  (with-indentation (20)
    (display-ast (ico:then-ast ast))
    (display-ast (ico:else-ast ast))))
