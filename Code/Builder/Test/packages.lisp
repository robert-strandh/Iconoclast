(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-builder-test
  (:use #:common-lisp #:parachute)
  (:local-nicknames
   (#:ico #:iconoclast)
   (#:bld #:iconoclast-builder)
   (#:ses #:s-expression-syntax))
  (:export #:test))
