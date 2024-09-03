(cl:in-package #:asdf-user)

(defsystem "iconoclast-closure-conversion-test"
  :depends-on ("iconoclast-closure-conversion"
               "iconoclast-builder"
               "iconoclast-ast-transformations"
               "concrete-syntax-tree"
               "common-macro-definitions"
               "clostrum"
               "common-boot")
  :serial t
  :components
  ((:file "packages")
   (:file "test")))
