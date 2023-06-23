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

(defmacro define-relations (ast-name relations)
  `(progn ,@(loop ;; Avoid MOP function CLASS-PROTOTYPE. 
                  with instance = (make-instance ast-name)
                  with designators = (ico:slot-designators instance)
                  for relation in relations
                  for designator = (find (third relation) designators
                                         :test #'eq :key #'second)
                  for slot-reader-name = (second designator)
                  when (null designator)
                    do (error "No designator for ~s in AST ~s"
                              (third relation)
                              ast-name)
                  collect
                  (let ((relation-name (first relation))
                        (relation-cardinality (first designator)))
                    `(progn
                       (defmethod relations append ((ast ,ast-name))
                         (if (null (,slot-reader-name ast))
                             '()
                             (list (cons ',relation-name
                                         ',relation-cardinality))))
                       
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
                                          (list right))))))))))))
