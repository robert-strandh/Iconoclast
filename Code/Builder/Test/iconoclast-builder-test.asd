(cl:in-package #:asdf-user)

(defsystem #:iconoclast-builder-test
  :depends-on (#:iconoclast-builder)
  :serial t
  :components
  ((:file "packages")
   (:file "convert-ast")
   (:file "locally")
   (:file "let")
   (:file "the")
   (:file "block")
   (:file "return-from")
   (:file "eval-when")
   (:file "if")
   (:file "quote")
   (:file "catch")
   (:file "unwind-protect")
   (:file "test")))
