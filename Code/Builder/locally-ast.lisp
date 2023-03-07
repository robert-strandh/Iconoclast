(cl:in-package #:iconoclast-builder)

(define-make-node-method :locally ico:locally-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:locally-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts
      (append (ico:form-asts left) (list right))))
