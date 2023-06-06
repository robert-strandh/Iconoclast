(cl:in-package #:iconoclast-builder)

(define-make-node-method :defpackage ico:defpackage-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :use))
     (left ico:defpackage-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :use-asts
    (append (ico:use-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :export))
     (left ico:defpackage-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :export-asts
    (append (ico:export-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :intern))
     (left ico:defpackage-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :intern-asts
    (append (ico:intern-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :shadow))
     (left ico:defpackage-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :shadow-asts
    (append (ico:shadow-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :import-from))
     (left ico:defpackage-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :import-from-asts
    (append (ico:import-from-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :shadowing-import-from))
     (left ico:defpackage-ast)
     (right t)
     &key)
  (reinitialize-instance left
    :shadowing-import-from-asts
    (append (ico:shadowing-import-from-asts left) (list right))))

(define-make-node-method :import-from ico:import-from-ast)

(defmethod abp:relate
    ((builder builder)
     (relation (eql :package))
     (left ico:import-from-ast)
     (right t)
     &key)
  (reinitialize-instance left :package-name-ast right))

