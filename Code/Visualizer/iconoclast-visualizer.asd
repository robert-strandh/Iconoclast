(cl:in-package #:asdf-user)

(defsystem #:iconoclast-visualizer
  :depends-on (#:iconoclast
               #:mcclim
               #:clouseau)
  :serial t
  :components
  ((:file "packages")
   (:file "display-ast")
   (:file "progn")
   (:file "name-ast")
   (:file "literal-ast")
   (:file "variable-binding-ast")
   (:file "block-ast")
   (:file "catch-ast")
   (:file "eval-when")
   (:file "flet-ast")
   (:file "return-from-ast")
   (:file "let-ast")
   (:file "gui")))
