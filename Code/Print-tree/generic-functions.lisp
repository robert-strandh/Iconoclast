(cl:in-package #:iconoclast-print-tree)

(defgeneric print-node (stream depth node))

(defmethod print-node (stream depth (node ico:ast))
  (format stream "~a" (class-name (class-of node))))

(defgeneric print-details (stream depth node)
      (:method-combination progn :most-specific-last))

(defgeneric children (node))

(defmethod print-node (stream depth (node cons))
  (format stream "list"))

(defmethod children ((node cons))
  (loop for element in node
        collect (cons "" element)))

(defmethod children ((node null))
  '())
