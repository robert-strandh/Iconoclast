(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :unparsed))
     &key source expression context)
  (case context
    ((:form :condition-report :restart-report-string
      :format-control :quote)
     (make-instance 'ico:unparsed-form-ast
       :origin source
       :form expression))
    ((:place)
     (make-instance 'ico:place-ast
       :origin source
       :place expression))
    ((:key)
     (make-instance 'ico:key-ast
       :key expression))
    ((:method-qualifier)
     (make-instance 'ico:method-qualifier-ast
       :name expression))
    (t (error "Unknown context: ~s" context))))

(defmethod abp:node-kind ((builder builder) (node ico:unparsed-form-ast))
  :unparsed)

(defmethod abp:node-kind ((builder builder) (node ico:place-ast))
  :unparsed)

(defmethod abp:node-kind ((builder builder) (node ico:method-qualifier-ast))
  :unparsed)

(defmethod abp:node-initargs ((builder builder) (node ico:unparsed-form-ast))
  `(:expression ,(ico:form node)))

(defmethod abp:node-initargs ((builder builder) (node ico:place-ast))
  `(:expression ,(ico:place node)))

(defmethod abp:node-initargs
    ((builder builder) (node ico:method-qualifier-ast))
  `(:expression ,(ico:name node)))
