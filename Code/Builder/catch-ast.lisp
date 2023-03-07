(cl:in-package #:iconoclast-builder)

(define-make-node-method :catch ico:catch-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :tag-form))
     (left ico:catch-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :tag-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:catch-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts
      (append (ico:form-asts left) (list right))))
