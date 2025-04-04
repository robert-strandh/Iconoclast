(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:case-normal-clause-ast))
  (with-indentation (20)
    (display-asts (ico:key-asts ast)))
  (display-asts (ico:form-asts ast)))

(defmethod display-ast ((ast ico:case-otherwise-clause-ast))
  (with-indentation (20)
    (draw-ast ast "otherwise"))
  (display-asts (ico:form-asts ast)))

(defmethod display-ast ((ast ico:case-ast))
  (draw-ast ast "case")
  (with-indentation (40)
    (display-ast (ico:keyform-ast ast)))
  (with-indentation (20)
    (display-asts (ico:clause-asts ast))))

(defmethod display-ast ((ast ico:ecase-ast))
  (draw-ast ast "ecase")
  (with-indentation (40)
    (display-ast (ico:keyform-ast ast)))
  (with-indentation (20)
    (display-asts (ico:clause-asts ast))))
