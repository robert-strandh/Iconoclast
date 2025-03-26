(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:cond-clause-ast))
  (with-indentation (20)
    (display-ast (ico:test-ast ast)))
  (display-asts (ico:form-asts ast)))

(defmethod display-ast ((ast ico:cond-ast))
  (draw-ast ast "cond")
  (with-indentation (20)
    (display-asts (ico:clause-asts ast))))
