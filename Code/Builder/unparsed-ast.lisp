(cl:in-package #:iconoclast-builder)

(defclass unparsed-ast (ico:ast)
  ())

(defgeneric form (ast))

(defclass unparsed-form-ast (unparsed-ast)
  ((%form
      :initarg :form
      :reader form)))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :unparsed))
     &key source expression context)
  (cond ((eql context :form)
         (make-instance 'unparsed-form-ast
            :origin source
            :form expression))
        (t (error "Unknown context: ~s" context))))
