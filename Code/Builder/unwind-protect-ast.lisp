(cl:in-package #:iconoclast-builder)

(define-make-node-method :unwind-protect ico:unwind-protect-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :protected))
     (left ico:unwind-protect-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :protected-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :cleanup))
     (left ico:unwind-protect-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))
