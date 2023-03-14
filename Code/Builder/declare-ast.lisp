(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :declaration))
     &key source ((:kind declaration-kind)))
  (make-instance
      (case declaration-kind
        (dynamic-extent 'ico:dynamic-extent-ast)
        (type 'ico:type-ast)
        (ftype 'ico:ftype-ast)
        (ignore 'ico:ignore-ast)
        (ignorable 'ico:ignorable-ast)
        (inline 'ico:inline-ast)
        (notinline 'ico:notinline-ast)
        (optimize 'ico:optimize-ast)
        #+(or)(declaration 'ico:declaration-ast))
    :origin source))

(defmethod abp:relate
    ((builder builder)
     (kind (eql :argument))
     (left ico:inline-or-notinline-ast)
     (right ico:function-name-ast)
     &key)
  (reinitialize-instance left
    :variable-asts (append (ico:variable-asts left) (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :declaration))
     (left ico:declaration-asts-mixin)
     (right ico:inline-or-notinline-ast)
     &key)
  (reinitialize-instance left
    :declaration-asts
      (append (ico:declaration-asts left)
              (list right))))
