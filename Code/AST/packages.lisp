(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast
  (:use #:common-lisp)
  (:shadow #:documentation)
  (:export
     #:ast
     #:origin
     #:children
     #:slot-designators
     #:?))
