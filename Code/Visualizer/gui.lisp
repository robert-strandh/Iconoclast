(cl:in-package #:iconoclast-visualizer)

(clim:define-application-frame visualizer ()
    ((%ast :initarg :ast :reader ast))
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
  (display-ast* (ast frame) pane 10 10))

;;; Default method for ASTs that have not yet been dealt with in
;;; specific methods.
(defmethod display-ast* (ast pane hpos vpos)
  (let* ((name (format nil "~s" (class-name (class-of ast))))
         (width (+ (clim:stream-string-width pane name) 10))
         (height 20))
    (draw-ast pane hpos vpos width height name)
    (+ vpos height 10)))

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
  (clouseau:inspect ast))

(define-visualizer-command (com-inspect-layout :name t)
    ((layout 'layout))
  (clouseau:inspect layout))
