(cl:in-package #:asdf-user)

(defsystem #:iconoclast
  :depends-on ()
  :serial t
  :components
  ((:file "packages")
   (:file "ast")
   (:file "declare-ast")
   (:file "function-ast")))
