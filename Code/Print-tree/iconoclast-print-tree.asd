(cl:in-package #:asdf-user)

(defsystem #:iconoclast-print-tree
  :depends-on (#:iconoclast
               #:utilities.print-tree)
  :serial t
  :components
  ((:file "packages")
   (:file "generic-functions")
   (:file "variable-ast")))
