(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-builder-test
  (:use #:common-lisp)
  (:local-nicknames
   (#:ico #:iconoclast)
   (#:bld #:iconoclast-builder))
  (:export #:test))
