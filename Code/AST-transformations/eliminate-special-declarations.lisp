(cl:in-package #:iconoclast-ast-transformations)

;;;; Special bindings have already been taken into account when every
;;;; VARIABLE-NAME-AST is turned into either a VARIABLE-DEFINITION-AST
;;;; (if the variable is lexical) or a SPECIAL-VARIABLE-BOUND-AST (if
;;;; the variable is special).  So, unless needed for some other
;;;; purpose, SPECIAL declarations can be removed without changing the
;;;; semantics, as they are not going to be consulted again.

(defclass eliminate-special-declarations-client (client) ())

(defmethod iaw:walk-ast-node :around
    ((client eliminate-special-declarations-client)
     (ast ico:declaration-asts-mixin))
  (loop for declaration-ast in (ico:declaration-asts ast)
        do (reinitialize-instance declaration-ast
             :declaration-specifier-asts
             (remove-if (lambda (declaration-specifier-ast)
                          (typep declaration-specifier-ast
                                 'ico:special-ast))
                        (ico:declaration-specifier-asts ast))))
  (call-next-method))

(defun eliminate-special-declarations (ast)
  (let ((client (make-instance 'eliminate-special-declarations-client)))
    (iaw:walk-ast client ast)))

