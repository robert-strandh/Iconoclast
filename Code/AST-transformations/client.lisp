(cl:in-package #:iconoclast-ast-transformations)

;;; This class should be a superclass of any class of which an
;;; instance is passed as the CLIENT argument to the transformations
;;; in this system.

(defclass client () ())
