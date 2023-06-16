(cl:in-package #:iconoclast-builder)

(define-make-node-method :prog2 ico:prog2-ast)

;;; FIXME: A better choice for the relation would have been
;;; :SECOND-FORM.

(defmethod abp:relate
    ((builder builder)
     (relation (eql :second))
     (left ico:prog2-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :second-form-ast right))
