(cl:in-package #:iconoclast-visualizer)

(clim:define-application-frame visualizer ()
  ((%ast :initarg :ast :accessor ast)
   (%previous :initform '() :accessor previous)
   (%selected-asts :initform '() :accessor selected-asts))
  (:panes (application
           :application
           :scroll-bars nil
           :display-function 'display-ast
           :text-style (clim:make-text-style :sans-serif :roman 12))
          (interactor :interactor :scroll-bars nil))
  (:layouts (default (clim:vertically (:width 1200 :height 900)
                       (4/5 (clim:scrolling () application))
                       (1/5 (clim:scrolling () interactor))))))

(defun display-ast (frame pane)
  (loop for y from 0 to 500 by 10
        do (if (zerop (mod y 50))
               (clim:draw-line* pane 0 y 10 y)
               (clim:draw-line* pane 0 y 5 y)))
  (display-ast* (ast frame) pane 10 10))

(defun visualize (ast &key new-process-p)
  (let ((frame (clim:make-application-frame 'visualizer :ast ast)))
    (flet ((run ()
             (clim:run-frame-top-level frame)))
      (if new-process-p
          (clim-sys:make-process #'run)
          (run)))))

(define-visualizer-command (com-quit :name t) ()
  (clim:frame-exit clim:*application-frame*))

(define-visualizer-command (com-inspect-ast :name t)
    ((ast 'iconoclast:ast))
  (clouseau:inspect ast :new-process t))

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
