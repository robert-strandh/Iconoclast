(cl:in-package #:iconoclast-builder)

(defclass builder ()
  ())

(defgeneric relations (ast)
  (:method-combination append))

(defmethod abp:node-relations ((builder builder) node)
  (relations node))

(defmacro define-make-node-method (kind class-name)
  `(progn 
     (defmethod abp:make-node
         ((builder builder)
          (kind (eql ,kind))
          &rest initargs
          &key source)
       (apply #'make-instance ',class-name
              :origin source
              :allow-other-keys t
              initargs))
     (defmethod abp:node-kind ((builder builder) (node ,class-name))
       ,kind)))

(defun initarg-from-slot-reader-name (slot-reader-name)
  (intern (symbol-name slot-reader-name) (find-package "KEYWORD")))

(defun find-designator (relation designators)
  (find (third relation) designators :test #'eq :key #'second))

(defmacro define-relations (ast-name relations)
  (let* (;; Avoid MOP function CLASS-PROTOTYPE.
         (instance (make-instance ast-name))
         (designators (ico:slot-designators instance)))
    `(progn (defmethod relations append ((ast ,ast-name))
              (append 
               ,@(loop for relation in relations
                       for designator = (find-designator relation designators)
                       for slot-reader-name = (second designator)
                       when (null designator)
                         do (error "No designator for ~s in AST ~s"
                                   (third relation)
                                   ast-name)
                       collect
                       (let ((relation-name (first relation))
                             (relation-cardinality (first designator)))
                         `(if (null (,slot-reader-name ast))
                              '()
                              (list (cons ',relation-name
                                          ,(if (eq relation-cardinality
                                                   'ico:?)
                                               ''abp:?
                                               `',relation-cardinality))))))))
            ,@(loop for relation in relations
                    for designator = (find-designator relation designators)
                    for slot-reader-name = (second designator)
                    when (null designator)
                      do (error "No designator for ~s in AST ~s"
                                (third relation)
                                ast-name)
                    collect
                    (let ((relation-name (first relation))
                          (relation-cardinality (first designator)))
                      `(progn
                         (defmethod abp:node-relation
                             ((builder builder)
                              (relation (eql ,relation-name))
                              (node ,ast-name))
                           (values (,slot-reader-name node) nil))

                         (defmethod abp:relate
                             ((builder builder)
                              (relation (eql ,relation-name))
                              (left ,ast-name)
                              (right ,(second relation))
                              &key)
                           (reinitialize-instance left
                             ,(initarg-from-slot-reader-name slot-reader-name)
                             ,@(case relation-cardinality
                                 ((ico:? 1)
                                  '(right))
                                 (otherwise
                                  `((append (,slot-reader-name left)
                                            (list right)))))))))))))
