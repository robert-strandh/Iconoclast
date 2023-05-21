(cl:in-package #:iconoclast-builder)

(define-make-node-method :defclass ico:defclass-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :metaclass))
     (left ico:defclass-ast)
     (right ico:type-name-ast)
     &key)
  (reinitialize-instance left :metaclass-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :default-initarg))
     (left ico:defclass-ast)
     (right ico:default-initarg-ast)
     &key)
  (reinitialize-instance left
    :default-initarg-asts
    (append (ico:default-initarg-asts left) (list right))))
