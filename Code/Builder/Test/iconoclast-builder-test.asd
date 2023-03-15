(cl:in-package #:asdf-user)

(defsystem #:iconoclast-builder-test
  :depends-on (#:iconoclast-builder)
  :serial t
  :components
  ((:file "packages")
   (:file "locally")
   (:file "the")
   (:file "test")))
