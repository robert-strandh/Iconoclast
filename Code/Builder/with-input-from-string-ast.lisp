(cl:in-package #:iconoclast-builder)

(define-make-node-method
    :with-input-from-string ico:with-input-from-string-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :var))
     (left ico:with-input-from-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :string))
     (left ico:with-input-from-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :string-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :index))
     (left ico:with-input-from-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :index-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :start))
     (left ico:with-input-from-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :start-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :end))
     (left ico:with-input-from-string-ast)
     (right t)
     &key)
  (reinitialize-instance left :end-ast right))
