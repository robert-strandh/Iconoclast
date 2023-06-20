(cl:in-package #:iconoclast-builder)

(define-make-node-method :with-open-file ico:with-open-file-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :stream))
     (left ico:with-open-file-ast)
     (right t)
     &key)
  (reinitialize-instance left :variable-name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :filespec))
     (left ico:with-open-file-ast)
     (right t)
     &key)
  (reinitialize-instance left :filespec-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :option))
     (left ico:with-open-file-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :option-asts (append (ico:option-asts left) (list right))))

