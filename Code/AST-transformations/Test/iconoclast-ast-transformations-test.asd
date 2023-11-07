(cl:in-package #:asdf-user)

(defsystem "iconoclast-ast-transformations-test"
  :depends-on ("iconoclast-ast-transformations"
               "iconoclast-builder"
               "common-boot"
               "common-macro-definitions"
               "parachute")
  :serial t
  :components
  ((:file "packages")
   (:file "utilities")
   (:file "configuration")
   (:file "lexify-lambda-list")
   (:file "application-lambda-to-labels")))
