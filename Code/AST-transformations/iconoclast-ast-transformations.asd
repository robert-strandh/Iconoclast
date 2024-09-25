(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-transformations"
  :depends-on ("iconoclast"
               "iconoclast-ast-walker")
  :serial t
  :components
  ((:file "packages")
   (:file "client")
   (:file "application-lambda-to-labels")
   (:file "function-lambda-to-labels")
   (:file "flet-to-labels")
   (:file "let-to-labels")
   (:file "letstar-to-labels")
   (:file "eliminate-special-declarations")
   (:file "lexify-lambda-list")
   (:file "extract-declaration-specifier-asts")
   (:file "split-declaration-specifier-ast")
   (:file "associate-variable-asts-and-declaration-specifier-asts")
   (:file "split-let-or-letstar-ast")
   (:file "replace-special-let-with-bind")
   (:file "extract-variable-asts-in-lambda-list")
   (:file "split-setq-ast")
   (:file "ast-parents")
   (:file "ast-ownership")
   (:file "escaped-functions")
   (:file "function-tree")
   (:file "local-function-inlining")
   (:file "closure-conversion")))
