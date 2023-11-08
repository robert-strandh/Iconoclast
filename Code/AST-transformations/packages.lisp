(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-ast-transformations
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:iaw #:iconoclast-ast-walker))
  (:export
   #:extract-declaration-specifier-asts
   #:split-declaration-specifier-ast
   #:application-lambda-to-labels
   #:function-lambda-to-labels
   #:flet-to-labels
   #:let-to-labels
   #:let*-to-labels
   #:eliminate-special-declarations
   #:lexify-lambda-list))