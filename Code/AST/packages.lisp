(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast
  (:use #:common-lisp)
  (:shadow #:documentation)
  (:export
     #:ast
     #:special-form-ast
     #:macro-form-ast
     #:function-form-ast
     #:origin
     #:children
     #:slot-designators
     #:?))
