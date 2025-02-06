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
   #:let-to-labels #:*let-to-labels-meter*
   #:let*-to-labels
   #:macrolet-to-locally
   #:eliminate-special-declarations
   #:lexify-lambda-list
   #:split-let-or-let*
   #:replace-special-let-with-bind
   #:split-setq
   #:ast-size
   #:compute-ast-info
   #:compute-escaped-functions
   #:inlinable-functions
   #:inline-functions
   #:inline-inlinable-functions
   #:assignment-conversion
   #:closure-conversion
   #:convert-block
   #:remove-unused-blocks
   #:remove-degenerate-labels
   #:convert-tagbody
   #:transform-function-definition-and-reference
   #:eliminate-function
   #:replace-trivial-locally-by-progn
   #:report))
