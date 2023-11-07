(cl:in-package #:iconoclast-ast-transformations-test)

(defclass client (cb:macro-transforming-client)
  ())

(defun parse-transform-and-unparse (form transformation)
  (let* ((cst (cst:cst-from-expression form))
         (environment (cb:create-environment))
         (client (make-instance 'client))
         (cmd:*client* client)
         (ast (cb:cst-to-ast client cst environment))
         (builder (make-instance 'bld:builder))
         (transformed-ast (funcall transformation ast)))
    (ses:unparse builder t transformed-ast)))

(defun parse-lexify-and-unparse (lambda-application)
  (parse-transform-and-unparse lambda-application #'iat:lexify-lambda-list))

;;; The problem that is solved by this function is that the
;;; transformation will introduce symbols using GENSYM, and we don't
;;; know what they will be.  So we just make sure that a symbol
;;; without a package in FORM1 corresponds to a symbol without a
;;; packate in FORM2, and that the correspondance is the same for
;;; every such pair of occurrences.
(defun forms-similar-p (form1 form2)
  (let ((table (make-hash-table :test #'eq)))
    (labels ((aux (form1 form2)
               (cond ((and (symbolp form1) (null (symbol-package form1))
                           (symbolp form2) (null (symbol-package form2)))
                      (let ((other (gethash form1 table)))
                        (if (null other)
                            ;; This is the first time we see the
                            ;; symbol in FORM1, so we enter the
                            ;; corresponding symbol in FORM2 in the
                            ;; table, and return true.
                            (progn (setf (gethash form1 table) form2) t)
                            ;; We have seen the symbol in FORM1
                            ;; before, so the symbol in FORM2 had
                            ;; better correspond to the table entry.
                            (eq form2 other))))
                     ((and (atom form1) (atom form2))
                      (eql form1 form2))
                     ((and (consp form1) (consp form2))
                      (and (aux (car form1) (car form2))
                           (aux (cdr form1) (cdr form2))))
                     (t nil))))
      (aux form1 form2))))
