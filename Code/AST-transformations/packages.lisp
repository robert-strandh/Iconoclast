(cl:in-package #:common-lisp-user)

(defpackage #:iconoclast-ast-transformations
  (:use #:common-lisp)
  (:local-nicknames (#:ico #:iconoclast)
                    (#:iaw #:iconoclast-ast-walker))
  (:export
   #:extract-declaration-specifier-asts
   #:extract-special-declared-variable-asts
   #:extract-variable-asts-in-lambda-list
   #:split-declaration-specifier-ast
   #:application-lambda-to-labels
   #:application-lambda-to-labels-everywhere
   #:function-lambda-to-labels
   #:function-lambda-to-labels-everywhere
   #:flet-to-labels
   #:flet-to-labels-everywhere
   #:let-to-labels
   #:let*-to-labels
   #:eliminate-special-declarations
   #:lexify-lambda-list
   #:split-let-or-let*
   #:replace-special-let-with-bind
   #:split-setq
   #:inlinable-functions))
