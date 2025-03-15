(cl:in-package #:asdf-user)

(defsystem #:iconoclast-visualizer
  :depends-on (#:iconoclast
               #:iconoclast-ast-transformations
               #:mcclim
               #:clouseau)
  :serial t
  :components
  ((:file "packages")
   (:file "layout")
   (:file "display-ast")
   (:file "utilities")
   (:file "progn-ast")
   (:file "name-ast")
   (:file "literal-ast")
   (:file "variable-binding-ast")
   (:file "block-ast")
   (:file "block-with-variable-ast")
   (:file "catch-ast")
   (:file "throw-ast")
   (:file "eval-when-ast")
   (:file "flet-ast")
   (:file "lambda-list-ast")
   (:file "local-function-ast")
   (:file "function-ast")
   (:file "go-ast")
   (:file "if-ast")
   (:file "return-from-ast")
   (:file "let-ast")
   (:file "let-temporary-ast")
   (:file "special-variable-bind-ast")
   (:file "load-time-value-ast")
   (:file "locally-ast")
   (:file "multiple-value-call-ast")
   (:file "multiple-value-prog1-ast")
   (:file "progv-ast")
   (:file "setq-ast")
   (:file "tagbody-ast")
   (:file "tagbody-with-variable-ast")
   (:file "the-ast")
   (:file "unwind-protect-ast")
   (:file "special-ast")
   (:file "ignore-ast")
   (:file "inline-ast")
   (:file "set-static-environment-ast")
   (:file "make-cell-ast")
   (:file "static-environment-ast")
   (:file "read-static-environment-ast")
   (:file "application-ast")
   (:file "gui")
   (:file "commands")))
