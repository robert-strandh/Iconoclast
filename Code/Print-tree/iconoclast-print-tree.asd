(cl:in-package #:asdf-user)

(defsystem #:iconoclast-print-tree
  :depends-on (#:iconoclast
               #:iconoclast-builder
               #:utilities.print-tree)
  :serial t
  :components
  ((:file "packages")
   (:file "generic-functions")
   (:file "unparsed")
   (:file "tag-ast")
   (:file "form-asts-mixin")
   (:file "name-ast-mixin")
   (:file "print-tree")))
