(cl:in-package #:iconoclast-builder)

(define-make-node-method :default-initarg ico:default-initarg-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:default-initarg-ast)
     (right t)
     &key)
  (reinitialize-instance left :name right))
