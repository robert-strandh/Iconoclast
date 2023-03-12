(cl:in-package #:iconoclast-builder)

(define-make-node-method :block ico:block-ast)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :block-name))
     &key source name)
  (make-instance 'ico:block-name-ast
    :origin source
    :name name))

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
