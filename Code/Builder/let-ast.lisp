(cl:in-package #:iconoclast-builder)

(define-make-node-method :value-binding ico:variable-binding-ast)

(define-make-node-method :let ico:let-ast)

(define-make-node-method :let* ico:let*-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:variable-binding-ast)
     (right ico:variable-definition-ast)
     &key)
  (reinitialize-instance left
    :variable-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :value))
     (left ico:variable-binding-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :binding))
     (left ico:let-or-let*-ast)
     (right ico:variable-binding-ast)
     &key)
  (reinitialize-instance left
    :variable-binding-asts
      (append (ico:variable-binding-asts left)
              (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :declaration))
     (left ico:let-or-let*-ast)
     (right ico:inline-or-notinline-ast)
     &key)
  (reinitialize-instance left
    :declaration-asts
      (append (ico:declaration-asts left)
              (list right))))
