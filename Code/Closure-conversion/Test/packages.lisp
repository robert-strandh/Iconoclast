(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-closure-conversion-test
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:bld #:iconoclast-builder)
                    (#:iat #:iconoclast-ast-transformations)
                    (#:icc #:iconoclast-closure-conversion)
                    (#:cst #:concrete-syntax-tree)
                    (#:cmd #:common-macro-definitions)
                    (#:clo #:clostrum)
                    (#:cb #:common-boot)))
