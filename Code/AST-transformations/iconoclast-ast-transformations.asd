(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-transformations"
  :depends-on ("iconoclast"
               "iconoclast-ast-walker")
  :serial t
  :components
  ((:file "packages")
   (:file "extract-declaration-specifier-asts")
   (:file "split-declaration-specifier-ast")
   (:file "associate-variable-asts-and-declaration-specifier-asts")
   (:file "split-let-or-letstar-ast")
   (:file "replace-special-let-with-bind")))
