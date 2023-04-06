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
   (:file "let-ast")
   (:file "gui")))
