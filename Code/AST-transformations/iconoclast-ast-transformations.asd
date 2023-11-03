(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-transformations"
  :depends-on ("iconoclast"
               "iconoclast-ast-walker")
  :serial t
  :components
  ((:file "packages")
   (:file "extract-declaration-specifier-asts")))
