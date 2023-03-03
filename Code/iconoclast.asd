(cl:in-package #:asdf-user)

(defsystem #:iconoclast
  :depends-on ()
  :serial t
  :components
  ((:file "packages")
   (:file "ast")
   (:file "declaration-specifier-asts")
   (:file "declare-ast")
   (:file "function-ast")
   (:file "block-ast")
   (:file "catch-ast")))
