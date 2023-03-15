(cl:in-package #:asdf-user)

(defsystem #:iconoclast-builder-test
  :depends-on (#:iconoclast-builder)
  :serial t
  :components
  ((:file "packages")
   (:file "convert-ast")
   (:file "locally")
   (:file "the")
   (:file "block")
   (:file "return-from")
   (:file "if")
   (:file "quote")
   (:file "unwind-protect")
   (:file "test")))
