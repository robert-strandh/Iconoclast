(cl:in-package #:iconoclast-print-tree)

(defun print-pair (stream depth pair)
  (unless (equal (car pair) "")
    (format stream "~a: " (car pair)))
  (print-node stream depth (cdr pair))
  t)

(defun print-pair-details (stream depth pair)
  (print-details stream depth (cdr pair)))

(defun children-of-pair (pair)
  (ico:children (cdr pair)))

(defun print-tree (ast)
  (fresh-line)
  (terpri)
  (utilities.print-tree:print-tree
   *standard-output* (cons "" ast)
   (utilities.print-tree:make-node-printer
    #'print-pair
    #'print-pair-details
    #'children-of-pair)))
