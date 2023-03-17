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
        (special 'ico:special-ast)
        #+(or)(declaration 'ico:declaration-ast))
    :origin source))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :declaration))
     (left ico:declaration-asts-mixin)
     (right ico:declaration-specifier-ast)
     &key)
  (reinitialize-instance left
    :declaration-asts
      (append (ico:declaration-asts left)
              (list right))))

(defmethod abp:relate
    ((builder builder)
     (relation (eql :argument))
     (left ico:declaration-specifier-ast)
     (right ico:name-mixin)
     &key)
  (reinitialize-instance left
    :name-asts (append (ico:name-asts left) (list right))))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :optimization-specification))
     &key source quality value)
  (make-instance
      (case quality
        (speed 'ico:speed-ast)
        (compilation-speed 'ico:compilation-speed-ast)
        (space 'ico:space-ast)
        (debug 'ico:debug-ast)
        (safety 'ico:safety-ast))
    :origin source :value value))
