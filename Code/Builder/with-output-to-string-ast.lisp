(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :with-output-to-string ico:with-output-to-string-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :var))
     (left ico:with-output-to-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :string))
     (left ico:with-output-to-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :string-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :element-type))
     (left ico:with-output-to-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :element-type-ast right))
