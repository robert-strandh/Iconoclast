(cl:in-package #:iconoclast-print-tree)

(defun print-tree (ast)
  (fresh-line)
  (terpri)
  (utilities.print-tree:print-tree
   *standard-output* ast
   (utilities.print-tree:make-node-printer
    #'print-node nil #'children)))
