(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :block))
     &key source)
  (make-instance 'ico:block-ast
    :origin source))

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
