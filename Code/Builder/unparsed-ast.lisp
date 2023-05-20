(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :unparsed))
     &key source expression context)
  (case context
    ((:form :condition-report :restart-report-string)
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
    (t (error "Unknown context: ~s" context))))
