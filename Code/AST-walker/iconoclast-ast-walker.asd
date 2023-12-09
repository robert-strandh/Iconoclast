(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-walker"
  :depends-on ("iconoclast")
  :serial t
  :components
  ((:file "packages")
   (:file "ast-walker")))

