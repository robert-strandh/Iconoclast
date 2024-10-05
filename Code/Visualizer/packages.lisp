(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-visualizer
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:iat #:iconoclast-ast-transformations))
  (:export #:visualize))
