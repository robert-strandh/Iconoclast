(cl:in-package #:iconoclast-builder)

;;; For DEFCLASS the relation is :SUPERCLASS and for DEFINE-CONDITION
;;; the relation is :PARENT-TYPE, so we need two different methods.

(defmethod abp:relate
    ((builder builder)
     (relation (eql :superclass))
     (left ico:superclass-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :superclass-asts (append (ico:superclass-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :parent-type))
     (left ico:superclass-asts-mixin)
     (right t)
     &key)
  (reinitialize-instance left
    :superclass-asts (append (ico:superclass-asts left) (list right))))
