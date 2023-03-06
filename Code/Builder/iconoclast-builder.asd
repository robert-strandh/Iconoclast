(cl:in-package #:asdf-user)

(defsystem #:iconoclast-builder
   :depends-on (#:architecture.builder-protocol
                #:s-expression-syntax
                #:iconoclast)
   :serial t
   :components
   ((:file "packages")
    (:file "builder")
    (:file "variable-ast")
    (:file "let-ast")
    (:file "block-ast")))
