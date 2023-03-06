(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :value-binding))
     &key source)
  (make-instance 'ico:variable-binding-ast
    :origin source))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :let))
     &key source)
  (make-instance 'ico:let-ast
    :origin source))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :let*))
     &key source)
  (make-instance 'ico:let*-ast
    :origin source))

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
     (left ico:let-ast)
     (right ico:variable-binding-ast)
     &key)
  (reinitialize-instance left
    :variable-binding-asts
      (append (ico:variable-binding-asts left)
              (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :form))
     (left ico:let-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :form-asts
      (append (ico:form-asts left)
              (list right))))
