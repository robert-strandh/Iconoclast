(cl:in-package #:iconoclast-builder)

(defmethod abp:make-node
    ((builder builder)
     (kind (eql :declaration-specifier))
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

(define-relations ico:declaration-asts-mixin
  ((:declaration ico:declaration-specifier-ast ico:declaration-asts)))

(define-relations ico:declaration-specifier-ast
  ((:argument ico:name-mixin ico:name-asts)))

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

(define-relations ico:optimize-ast
  ((:argument ico:optimize-quality-ast ico:quality-asts)))
