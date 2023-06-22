(cl:in-package #:iconoclast-builder)

(define-make-node-method :eval-when ico:eval-when-ast)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :eval-when-situation))
     &key situation source)
  (make-instance 'ico:situation-ast
    :origin source
    :name situation))

(define-relations ico:eval-when-ast
  ((:situation t ico:situation-asts)))
