(cl:in-package #:iconoclast-visualizer)

(define-visualizer-command (com-quit :name t) ()
  (clim:frame-exit clim:*application-frame*))

(define-visualizer-command (com-inspect-ast :name t)
    ((ast 'ico:ast))
  (clouseau:inspect ast :new-process t))

(defgeneric show-relations (ast))

(defmethod show-relations (ast)
  ())

(defmethod show-relations ((ast ico:variable-definition-ast))
  (setf (selected-asts clim:*application-frame*)
        (cons ast (ico:reference-asts ast))))

(defmethod show-relations ((ast ico:variable-reference-ast))
  (show-relations (ico:definition-ast ast)))

(define-visualizer-command (com-show-relations :name t)
    ((ast 'ico:variable-name-ast))
  (show-relations ast))

(clim:define-presentation-to-command-translator inspect-ast
    (ico:ast com-inspect-ast visualizer)
    (object)
  `(,object))

(clim:define-presentation-to-command-translator show-relations
    (ico:variable-name-ast com-show-relations visualizer)
    (object)
  `(,object))

(define-visualizer-command (com-inspect-layout :name t)
    ((layout 'layout))
  (clouseau:inspect layout))

(define-visualizer-command (com-simplify-ast :name t) ()
  (let ((ast (ast clim:*application-frame*)))
    (push ast (previous clim:*application-frame*))
    (setq ast (iat:lexify-lambda-list ast)
          ast (iat:split-let-or-let* ast)
          ast (iat:replace-special-let-with-bind ast)
          ast (iat:let-to-labels ast)
          ast (iat:flet-to-labels ast)
          ast (iat:split-setq ast))
    (setf (ast clim:*application-frame*) ast)))

(define-visualizer-command (com-back :name t) ()
  (setf (ast clim:*application-frame*)
        (pop (previous clim:*application-frame*))))

(define-visualizer-command (com-inlinable-functions :name t) ()
  (let* ((ast (ast clim:*application-frame*))
         (ast-info (iat:compute-ast-info ast)))
    (setf (selected-asts clim:*application-frame*)
          (iat:inlinable-functions ast ast-info))))

(define-visualizer-command (com-inline-selected-functions :name t) ()
  (let* ((ast (ast clim:*application-frame*))
         (selected-asts (selected-asts clim:*application-frame*))
         (ast-info (iat:compute-ast-info ast)))
    (iat:inline-functions selected-asts ast-info)))

(define-visualizer-command (com-escaped-functions :name t) ()
  (let* ((ast (ast clim:*application-frame*))
         (ast-info (iat:compute-ast-info ast)))
    (setf (selected-asts clim:*application-frame*)
          (iat:compute-escaped-functions ast ast-info))))

(define-visualizer-command (com-macrolet-to-locally :name t) ()
  (let ((ast (ast clim:*application-frame*)))
    (iat:macrolet-to-locally ast)))

(define-visualizer-command (com-clear-selection :name t) ()
  (setf (selected-asts clim:*application-frame*) '()))

(define-visualizer-command (com-ast-size :name t) ()
  (format *standard-input*
          "Size is: ~s~%"
          (iat:ast-size (ast clim:*application-frame*))))
