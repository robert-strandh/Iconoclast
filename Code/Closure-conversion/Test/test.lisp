(cl:in-package #:iconoclast-closure-conversion-test)

(defclass client (icc:tree-node-client) ())

(defmethod cb:convert-with-parser-p ((client client) operator)
  (special-operator-p operator))

(defmethod cb:convert-with-ordinary-macro-p ((client client) operator)
  (cmd:macro-function-exists-p operator))

(defun make-environment (client)
  (let ((environment (make-instance 'clostrum-basic:run-time-environment)))
    (loop for symbol being each symbol of (find-package '#:common-lisp)
          when (special-operator-p symbol)
            do (clo:make-special-operator client environment symbol t))
    environment))

(defun cst-to-ast (client cst environment)
  (let ((cmd:*client* client))
    (cb:cst-to-ast client cst environment)))

(defun form-to-ast (client form environment)
  (cst-to-ast client (cst:cst-from-expression form) environment))

(defun test (form)
  (let* ((client (make-instance 'client))
         (environment (make-environment client))
         (ast (form-to-ast client form environment)))
    ast))
    
(defun test1 ()
  (test '(progn (let ((x 10) (y 20)) (+ x y)) (let ((z 30)) z))))

  
