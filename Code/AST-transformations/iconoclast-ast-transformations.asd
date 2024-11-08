(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-transformations"
  :depends-on ("iconoclast"
               "iconoclast-ast-walker")
  :serial t
  :components
  ((:file "packages")
   (:file "client")
   (:file "ast-size")
   (:file "meters")
   (:file "application-lambda-to-labels")
   (:file "function-lambda-to-labels")
   (:file "flet-to-labels")
   (:file "let-to-labels")
   (:file "letstar-to-labels")
   (:file "macrolet-to-locally")
   (:file "eliminate-special-declarations")
   (:file "lexify-lambda-list")
   (:file "extract-declaration-specifier-asts")
   (:file "split-declaration-specifier-ast")
   (:file "associate-variable-asts-and-declaration-specifier-asts")
   (:file "split-let-or-letstar-ast")
   (:file "replace-special-let-with-bind")
   (:file "extract-variable-asts-in-lambda-list")
   (:file "split-setq-ast")
   (:file "ast-info")
   (:file "compute-parent-asts")
   (:file "compute-owner-asts")
   (:file "escaped-functions")
   (:file "function-tree")
   (:file "call-graph")
   (:file "captured-variable")
   (:file "compute-ast-info")
   (:file "local-function-inlining")
   (:file "assignment-conversion")
   (:file "convert-block")
   (:file "remove-unused-blocks")
   (:file "convert-tagbody")
   (:file "transform-function-definition-and-reference")
   (:file "eliminate-function")
   (:file "closure-conversion")))
