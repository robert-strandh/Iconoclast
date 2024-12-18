(cl:in-package #:iconoclast-builder)

(defun make-declaration-specifier-ast (class-name identifier-name origin)
  (make-instance class-name
    :identifier-ast (make-instance 'ico:name-ast :name identifier-name)
    :origin origin))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :declaration-specifier))
     &key source ((:kind declaration-kind)))
  (make-declaration-specifier-ast
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
     #+(or)(declaration 'ico:declaration-declaration-ast))
   declaration-kind source))

(defmethod abp:node-kind
    ((builder builder) (node ico:declaration-specifier-ast))
  :declaration-specifier)

(defmethod abp:node-initargs
    ((builder builder) (node ico:declaration-specifier-ast))
  (list :kind (ico:name (ico:identifier-ast node))))

(define-make-node-method :declaration ico:declaration-ast)

(define-relations ico:declaration-ast
  ((:declaration-specifier t ico:declaration-specifier-asts)))

(define-relations ico:declaration-asts-mixin
  ((:declaration ico:declaration-ast ico:declaration-asts)))

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :optimization-specification))
     &key source quality value)
  (make-instance
      (case (cst:raw quality)
        (speed 'ico:speed-ast)
        (compilation-speed 'ico:compilation-speed-ast)
        (space 'ico:space-ast)
        (debug 'ico:debug-ast)
        (safety 'ico:safety-ast))
    :origin source :value value))

(defmethod abp:node-kind
    ((builder builder) (node ico:speed-ast))
  :optimization-specification)

(defmethod abp:node-initargs
    ((builder builder) (node ico:speed-ast))
  `(:source ,(ico:origin node)
    :quality 'speed
    :value ,(ico:value node)))

(defmethod abp:node-kind
    ((builder builder) (node ico:compilation-speed-ast))
  :optimization-specification)

(defmethod abp:node-initargs
    ((builder builder) (node ico:compilation-speed-ast))
  `(:source ,(ico:origin node)
    :quality 'compilation-speed
    :value ,(ico:value node)))

(defmethod abp:node-kind
    ((builder builder) (node ico:space-ast))
  :optimization-specification)

(defmethod abp:node-initargs
    ((builder builder) (node ico:space-ast))
  `(:source ,(ico:origin node)
    :quality 'space
    :value ,(ico:value node)))

(defmethod abp:node-kind
    ((builder builder) (node ico:debug-ast))
  :optimization-specification)

(defmethod abp:node-initargs
    ((builder builder) (node ico:debug-ast))
  `(:source ,(ico:origin node)
    :quality 'debug
    :value ,(ico:value node)))

(defmethod abp:node-kind
    ((builder builder) (node ico:safety-ast))
  :optimization-specification)

(defmethod abp:node-initargs
    ((builder builder) (node ico:safety-ast))
  `(:source ,(ico:origin node)
    :quality 'safety
    :value ,(ico:value node)))

(define-relations ico:optimize-ast
  ((:argument ico:optimize-quality-ast ico:quality-asts)))
