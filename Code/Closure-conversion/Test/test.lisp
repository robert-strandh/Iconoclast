(cl:in-package #:iconoclast-closure-conversion-test)

(defclass client (icc:tree-node-client
                  trucler-reference:client)
  ())

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

(defun simplify-ast (ast)
  (let* ((ast (iat:lexify-lambda-list ast))
         (ast (iat:split-let-or-let* ast))
         (ast (iat:replace-special-let-with-bind ast))
         (ast (iat:let-to-labels ast))
         (ast (iat:flet-to-labels ast)))
    ast))

(defun cst-to-ast (client cst environment)
  (let ((cmd:*client* client))
    (cb:cst-to-ast client cst environment)))

(defun form-to-ast (client form environment)
  (cst-to-ast client (cst:cst-from-expression form) environment))

(defun test-ast (form)
  (let* ((client (make-instance 'client))
         (global-environment (make-environment client))
         (environment (make-instance 'trucler-reference:environment
                        :global-environment global-environment))
         (ast (form-to-ast client form environment)))
    (simplify-ast ast)))
    
(defun test (form)
  (icc:compute-function-tree (test-ast form)))

(defun test1 ()
  (test '(progn (let ((x 10) (y 20)) (+ x y)) (let ((z 30)) z))))

  
