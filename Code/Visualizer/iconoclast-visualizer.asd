(cl:in-package #:asdf-user)

(defsystem #:iconoclast-visualizer
  :depends-on (#:iconoclast
               #:mcclim)
  :serial t
  :components
  ((:file "packages")))
