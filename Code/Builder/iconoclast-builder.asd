(cl:in-package #:asdf-user)

(defsystem #:iconoclast-builder
   :depends-on (#:architecture.builder-protocol
                #:s-expression-syntax
                #:iconoclast)
   :serial t
   :components
   ((:file "packages")
    (:file "builder")
    (:file "test")
    (:file "unparsed-ast")
    (:file "documentation-ast-mixin")
    (:file "documentation-ast")
    (:file "name-asts-mixin")
    (:file "clause-asts-mixin")
    (:file "string-designator-ast")
    (:file "form-asts-mixin")
    (:file "test-ast-mixin")
    (:file "type-specifier-asts")
    (:file "declare-ast")
    (:file "name-ast")
    (:file "let-ast")
    (:file "block-ast")
    (:file "return-from-ast")
    (:file "catch-ast")
    (:file "eval-when-ast")
    (:file "lambda-list-ast")
    (:file "macro-definition-ast")
    (:file "lambda-expression-ast")
    (:file "function-ast")
    (:file "tagbody-ast")
    (:file "go-ast")
    (:file "if-ast")
    (:file "flet-ast")
    (:file "load-time-value-ast")
    (:file "locally-ast")
    (:file "multiple-value-call-ast")
    (:file "multiple-value-prog1-ast")
    (:file "progn-ast")
    (:file "progv-ast")
    (:file "quote-ast")
    (:file "symbol-macrolet-ast")
    (:file "the-ast")
    (:file "unwind-protect-ast")
    (:file "setq-ast")
    (:file "case-ast")
    (:file "cond-ast")
    (:file "declaim-ast")
    (:file "defvar-ast")
    (:file "defmethod-ast")
    (:file "defun-ast")
    (:file "defclass-ast")
    (:file "in-package-ast")
    (:file "multiple-value-bind-ast")
    (:file "restart-bind-ast")
    (:file "restart-case-ast")
    (:file "return-ast")
    (:file "typecase-ast")
    (:file "when-ast")))
