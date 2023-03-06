(cl:in-package #:iconoclast-builder)

(define-make-node-method :block ico:block-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:block-ast)
     (right t)
     &key)
  (reinitialize-instance left
    ;; We need source information
    ;; for the name, no?
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:block-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts
      (append (ico:form-asts left)
              (list right))))
