(cl:in-package #:iconoclast-builder)

(define-make-node-method :defgeneric ico:defgeneric-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:defgeneric-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :generic-function-class))
     (left ico:defgeneric-ast)
     (right t)
     &key)
  (reinitialize-instance left :generic-function-class-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :method-class))
     (left ico:defgeneric-ast)
     (right t)
     &key)
  (reinitialize-instance left :method-class-ast right))

(define-make-node-method :method-combination-name ico:name-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :method-combination))
     (left ico:defgeneric-ast)
     (right ico:name-ast)
     &key)
  (reinitialize-instance
      left
    :method-combination-name-and-arguments-ast
    (make-instance 'ico:method-combination-name-and-arguments-ast
      :name-ast right)))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :method-combination-argument))
     (left ico:defgeneric-ast)
     (right t)
     &key)
  (reinitialize-instance
      (ico:method-combination-name-and-arguments-ast left)
    :method-combination-arguments
    (append (ico:method-combination-arguments
             (ico:method-combination-name-and-arguments-ast left))
     (list right)))
  left)

(define-make-node-method :method-description ico:method-description-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :method))
     (left ico:defgeneric-ast)
     (right ico:method-description-ast)
     &key)
  (reinitialize-instance
      left
    :method-description-asts
    (append (ico:method-description-asts left) (list right))))
