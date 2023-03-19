(cl:in-package #:iconoclast-builder)

(define-make-node-method :flet ico:flet-ast)

(define-make-node-method :labels ico:labels-ast)

(define-make-node-method :macrolet ico:macrolet-ast)

(define-make-node-method :local-function-binding ico:lexical-function-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:lexical-function-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :name-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :binding))
     (left ico:flet-or-labels-or-macrolet-ast)
     (right ico:lexical-function-ast)
     &key)
  (reinitialize-instance left
    :lexical-function-asts
    (append (ico:lexical-function-asts left) (list right))))