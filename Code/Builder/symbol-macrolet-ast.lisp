(cl:in-package #:iconoclast-builder)

(define-make-node-method :symbol-macro-binding ico:symbol-expansion-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :name))
     (left ico:symbol-expansion-ast)
     (right ico:variable-ast)
     &key)
  (reinitialize-instance left
    :symbol-ast right))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :expansion))
     (left ico:symbol-expansion-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :expansion-ast right))

(define-make-node-method :symbol-macrolet ico:symbol-macrolet-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :binding))
     (left ico:symbol-macrolet-ast)
     (right ico:symbol-expansion-ast)
     &key)
  (reinitialize-instance left
    :symbol-expansion-asts
      (append (ico:symbol-expansion-asts left) (list right))))
