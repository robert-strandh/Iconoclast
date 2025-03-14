(cl:in-package #:iconoclast-visualizer)

(defmethod display-ast ((ast ico:required-parameter-ast))
  (let* ((name "required-parameter"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:name-ast ast)))))

(defmethod display-ast ((ast ico:optional-parameter-ast))
  (let* ((name "optional-parameter"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:name-ast ast))
      (display-ast (ico:init-form-ast ast))
      (display-ast (ico:supplied-p-parameter-ast ast)))))

(defmethod display-ast ((ast ico:rest-parameter-ast))
  (let* ((name "rest-parameter"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:name-ast ast)))))

(defmethod display-ast ((ast ico:key-parameter-ast))
  (let* ((name "key-parameter"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:keyword-ast ast))
      (display-ast (ico:name-ast ast))
      (display-ast (ico:init-form-ast ast))
      (display-ast (ico:supplied-p-parameter-ast ast)))))

(defmethod display-ast ((ast ico:aux-parameter-ast))
  (let* ((name "aux-parameter"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:name-ast ast))
      (display-ast (ico:form-ast ast)))))

(defmethod display-ast ((ast ico:required-section-ast))
  (let* ((name "required-section"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-asts (ico:parameter-asts ast)))))

(defmethod display-ast ((ast ico:optional-section-ast))
  (let* ((name "optional-section"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-asts (ico:parameter-asts ast)))))

(defmethod display-ast ((ast ico:rest-section-ast))
  (let* ((name "rest-section"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:parameter-ast ast)))))

(defmethod display-ast ((ast ico:key-section-ast))
  (let* ((name "key-section"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-asts (ico:parameter-asts ast))
      (display-ast (ico:allow-other-keys-ast ast)))))

(defmethod display-ast ((ast ico:aux-section-ast))
  (let* ((name "key-section"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-asts (ico:parameter-asts ast)))))

(defmethod display-ast ((ast ico:ordinary-lambda-list-ast))
  (let* ((name "ordinary-lambda-list"))
    (draw-ast ast name)
    (with-indentation (20)
      (display-ast (ico:required-section-ast ast))
      (display-ast (ico:optional-section-ast ast))
      (display-ast (ico:key-section-ast ast))
      (display-ast (ico:aux-section-ast ast)))))
