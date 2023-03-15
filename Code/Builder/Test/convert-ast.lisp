(cl:in-package #:iconoclast-builder-test)

(defgeneric convert-ast (ast))

(defmethod convert-ast ((ast null))
  '())

(defmethod convert-ast ((ast cons))
  (mapcar #'convert-ast ast))

(defun convert-child (child)
  (if (equal (car child) "")
      (convert-ast (cdr child))
      (list (car child) (convert-ast (cdr child)))))

(defun convert-children (children)
  (sort (mapcar #'convert-child children)
        #'string-lessp
        :key #'car))

(defmethod convert-ast (ast)
  (cons (class-name (class-of ast))
        (convert-children (ico:children ast))))
