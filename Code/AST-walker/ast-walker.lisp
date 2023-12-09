(cl:in-package #:iconoclast-ast-walker)

;;;; This function implements a general AST walker.  All it does it
;;;; traverse the AST tree without invoking any action.  To implement
;;;; some action, client code can define an :AROUND method on
;;;; WALK-AST-NODE, that specializes to a particular CLIENT class.
;;;; That around method can then implement actions before or after
;;;; recursive processing takes place, or call WALK-AST-NODE
;;;; recursively with some new AST node.

(defgeneric walk-ast-node (client node))

(defmethod walk-ast-node (client node)
  node)

(defun set-slot (ast reader-name value)
  (let* ((symbol-name (symbol-name reader-name))
         (initarg (intern symbol-name (find-package "KEYWORD"))))
    (reinitialize-instance ast initarg value)))

(defmethod walk-ast-node (client (ast iconoclast:ast))
  (loop for (cardinality slot-reader) in (iconoclast:slot-designators ast)
        do (ecase cardinality
             (*
              (set-slot ast slot-reader
                        (loop for child in (funcall slot-reader ast)
                              collect (walk-ast-node client child))))
             (iconoclast:?
              (let ((possible-child (funcall slot-reader ast)))
                (unless (null possible-child)
                  (set-slot ast slot-reader
                            (walk-ast-node client possible-child)))))
             (1
              (let ((child (funcall slot-reader ast)))
                (set-slot ast slot-reader
                          (walk-ast-node client child))))))
  ast)

(defvar *visited*)

(defmethod walk-ast-node :around (client node)
  (if (gethash node *visited*)
      node
      (progn 
        (setf (gethash node *visited*) t)
        (call-next-method))))

(defgeneric walk-ast (client ast))

(defmethod walk-ast (client ast)
  (let ((*visited* (make-hash-table :test #'eq)))
    (walk-ast-node client ast)))
