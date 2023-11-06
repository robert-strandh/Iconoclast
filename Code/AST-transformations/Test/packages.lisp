(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-ast-transformations-test
  (:use #:common-lisp #:parachute)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:bld #:iconoclast-builder)
                    (#:abp #:architecture.builder-protocol)
                    (#:ses #:s-expression-syntax)
                    (#:cmd #:common-macro-definitions)
                    (#:cb #:common-boot)
                    (#:iat #:iconoclast-ast-transformations))
  (:export #:test))
