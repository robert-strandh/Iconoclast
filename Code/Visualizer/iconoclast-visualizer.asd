(cl:in-package #:asdf-user)

(defsystem #:iconoclast-visualizer
  :depends-on (#:iconoclast
               #:mcclim
               #:clouseau)
  :serial t
  :components
  ((:file "packages")
   (:file "display-ast")
   (:file "progn-ast")
   (:file "name-ast")
   (:file "literal-ast")
   (:file "variable-binding-ast")
   (:file "block-ast")
   (:file "catch-ast")
   (:file "eval-when-ast")
   (:file "flet-ast")
   (:file "function-ast")
   (:file "go-ast")
   (:file "if-ast")
   (:file "return-from-ast")
   (:file "let-ast")
   (:file "load-time-value-ast")
   (:file "locally-ast")
   (:file "multiple-value-call-ast")
   (:file "gui")))
