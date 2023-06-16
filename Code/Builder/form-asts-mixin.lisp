(cl:in-package #:iconoclast-builder)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:form-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts (append (ico:form-asts left) (list right))))

;;; FIXME: :REST is a poor choice.

(defmethod abp:relate
    ((builder builder)
     (relation (eql :rest))
     (left ico:prog1-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :first-form-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :rest))
     (left ico:prog2-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :first-form-ast right))
