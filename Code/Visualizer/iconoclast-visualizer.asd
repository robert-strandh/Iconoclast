(cl:in-package #:asdf-user)

(defsystem #:iconoclast-visualizer
  :depends-on (#:iconoclast
               #:mcclim
               #:clouseau)
  :serial t
  :components
  ((:file "packages")
   (:file "display-ast")
   (:file "gui")))
