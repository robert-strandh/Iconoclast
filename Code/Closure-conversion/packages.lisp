(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-closure-conversion
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:aw #:iconoclast-ast-walker))
  (:export))
