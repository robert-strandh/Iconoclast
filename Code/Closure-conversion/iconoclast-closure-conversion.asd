(cl:in-package #:asdf-user)

(defsystem "iconoclast-closure-conversion"
  :depends-on ("iconoclast"
               "iconoclast-ast-walker")
  :serial t
  :components
  ((:file "packages")
   (:file "function-tree")))
