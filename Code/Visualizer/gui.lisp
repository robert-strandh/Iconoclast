(cl:in-package #:iconoclast-visualizer)

(clim:define-application-frame visualizer ()
  ((%ast :initarg :ast :accessor ast)
   (%previous :initform '() :accessor previous)
   (%selected-asts :initform '() :accessor selected-asts))
  (:panes (application
           :application
           :scroll-bars nil
           :display-function 'display-ast-pane
           :text-style (clim:make-text-style :sans-serif :roman 12))
          (interactor :interactor :scroll-bars nil))
  (:layouts (default (clim:vertically (:width 1200 :height 900)
                       (4/5 (clim:scrolling () application))
                       (1/5 (clim:scrolling () interactor))))))

(defun display-ast-pane (frame pane)
  (let ((*pane* pane))
    (display-ast (ast frame))))

(defun visualize (ast &key new-process)
  (let ((frame (clim:make-application-frame 'visualizer :ast ast)))
    (flet ((run ()
             (clim:run-frame-top-level frame)))
      (if new-process
          (clim-sys:make-process #'run)
          (run)))))
