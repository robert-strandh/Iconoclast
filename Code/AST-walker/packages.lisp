(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-ast-walker
  (:use #:common-lisp)
  (:export #:walk-ast)
  (:export #:walk-ast-node))
