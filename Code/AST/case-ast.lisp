(cl:in-package #:iconoclast)

;;; FIXME: How do we distinguish between a clause that
;;; has the key (say) A and one that has the key (A)?

(define-ast-class case-clause-ast (form-asts-mixin ast)
  ())

(define-ast-class case-normal-clause-ast (case-clause-ast)
  ((* key-asts)))

(define-ast-class case-otherwise-clause-ast (case-clause-ast)
  ())

(define-ast-class key-ast (ast)
  ((%key :initarg :key :reader key)))

(define-ast-class case-or-ecase-ast (clause-asts-mixin macro-form-ast)
  ((1 keyform-ast)))

(define-ast-class case-ast (case-or-ecase-ast)
  ())

(define-ast-class ecase-ast (case-or-ecase-ast)
  ())

(define-ast-class ccase-ast (clause-asts-mixin macro-form-ast)
  ((1 keyplace-ast)))
