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
  (case context
    ((:form :restart-report-string)
     (make-instance 'unparsed-form-ast
       :origin source
       :form expression))
    ((:place)
     (make-instance 'ico:place-ast
       :origin source
       :place expression))
    ((:key)
     (make-instance 'ico:key-ast
       :key expression))
    (t (error "Unknown context: ~s" context))))
