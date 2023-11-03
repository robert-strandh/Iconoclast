(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-ast-transformations
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:iaw #:iconoclast-ast-walker))
  (:export
   #:extract-declaration-specifier-asts
   #:split-declaration-specifier-ast))
