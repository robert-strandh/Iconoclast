(cl:in-package #:iconoclast)

;;;; The AST is a very close representation of the source code, except
;;;; that the environment is no longer present, so that there are no
;;;; longer any different namespaces for functions and variables.  And
;;;; of course, operations such as MACROLET are not present because
;;;; they only alter the environment.

(defgeneric origin (ast))

;;; The base class for all ASTs.
(defclass ast ()
  ((%origin :initarg :origin :initform nil :reader origin)))

;;; This generic function returns a list of pairs.  The CAR of each
;;; pair is a string that names the child in question, and the CDR is
;;; the child AST.  We use the APPEND method combination so that each
;;; class supplies a method that returns a list of only the children
;;; that that class contributes.
(defgeneric children (ast)
  (:method-combination append :most-specific-last))

;;; The default method returns the empty list.
(defmethod children append (ast)
  '())

(defmethod children append ((node cons))
  (loop for element in node
        collect (cons "" element)))

(defgeneric slot-designators (ast)
  (:method-combination append))

(defun slot-name-from-reader-name (reader-name)
  (intern (concatenate 'string "%" (symbol-name reader-name))))

(defun initarg-from-reader-name (reader-name)
  (intern (symbol-name reader-name) (find-package "KEYWORD")))

(defun reader-name-from-slot-designator (slot-designator)
  (if (member (first slot-designator) '(? 1 *))
      (second slot-designator)
      (getf (rest slot-designator) :reader)))

(defun slot-specifier-from-slot-designator (slot-designator)
  (case (first slot-designator)
    (?
     ;; This case indicates a slot that may or may not be assigned to
     ;; during reinitialization, and if it is assigned to, it is once
     ;; with the final value.  So we give it NIL as an initial value,
     ;; which then indicates that no such assignment has been made.
     (let ((name (reader-name-from-slot-designator slot-designator)))
       `(,(slot-name-from-reader-name name)
         :initform nil
         :initarg ,(initarg-from-reader-name name)
         :reader ,name)))
    (1
     ;; This case indicates a slot that must be assigned to with its
     ;; final value once during reinitialization.  So we do not give
     ;; it an initial value.  If it is not assigned to during
     ;; reinitialization, then this is an error, indicated by the
     ;; fact that the slot is unbound.
     (let ((name (reader-name-from-slot-designator slot-designator)))
       `(,(slot-name-from-reader-name name)
         :initarg ,(initarg-from-reader-name name)
         :reader ,name)))
    (*
     ;; This case indicates a slot that contains a list of zero or
     ;; more values.  So it may be reinitialized zero or more times.
     ;; So we give it an initial value of the empty list, which much
     ;; be appended to during each reinitialization.
     (let ((name (reader-name-from-slot-designator slot-designator)))     
       `(,(slot-name-from-reader-name name)
         :initform '()
         :initarg ,(initarg-from-reader-name name)
         :reader ,name)))
    (otherwise slot-designator)))

(defun child-name-from-slot-reader-name (slot-reader-name)
  (string-downcase (symbol-name slot-reader-name)))

(defun child-clause-from-slot-designator (slot-designator)
  (let ((reader-name (reader-name-from-slot-designator slot-designator)))
    `(cons ,(child-name-from-slot-reader-name reader-name)
           (,reader-name ast))))

(defmacro define-ast-class (name superclass-names slot-designators)
  `(progn ,@(loop for designator in slot-designators
                  for name = (reader-name-from-slot-designator designator)
                  collect `(ensure-generic-function ',name :lambda-list '(ast))
                  collect `(export ',name))

          (export ',name)

          (defclass ,name ,superclass-names
            ,(mapcar #'slot-specifier-from-slot-designator slot-designators))

          (defmethod children append ((ast ,name))
            (list ,@(mapcar #'child-clause-from-slot-designator
                            slot-designators)))

          (defmethod slot-designators append ((ast ,name))
            '(,@(loop for slot-designator in slot-designators
                      when (member (first slot-designator) '(? 1 *))
                        collect slot-designator)))))

; LocalWords:  reinitialization
