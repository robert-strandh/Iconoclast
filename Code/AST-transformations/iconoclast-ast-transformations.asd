(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-transformations"
  :depends-on ("iconoclast"
               "iconoclast-ast-walker")
  :serial t
  :components
  ((:file "packages")
   (:file "extract-declaration-specifier-asts")
   (:file "split-declaration-specifier-ast")
   (:file "split-let-or-letstar-ast")))
