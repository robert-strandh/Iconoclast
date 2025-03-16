(cl:in-package #:iconoclast-ast-transformations)

;;;; This transformation applies to AST types that have an ordinary
;;;; lambda list.  It applies in four cases:
;;;;
;;;;   1. One of the parameters (including SUPPLIED-P parameters) is
;;;;      a special variable.
;;;;
;;;;   2. One of the &OPTIONAL or &KEY parameters lacks a SUPPLIED-P
;;;;      parameter.
;;;; 
;;;;   3. One of the &OPTIONAL or &KEY parameters has an INIT-FORM
;;;;      other than NIL.
;;;; 
;;;;   4. The lambda list has at least one &AUX parameter.
;;;;
;;;; The body (including the declarations) of the form that has the
;;;; lambda list is wrapped in a LET* form.  The LET* form has a
;;;; binding corresponding to the lambda-list parameters as described
;;;; below.
;;;;
;;;; Every required parameter p is replaced by a new lexical variable,
;;;; say l, and the LET* form is given a binding (p l).
;;;;
;;;; Every &OPTIONAL parameter of the form p or (p) is replaced by (l1
;;;; NIL l2) where l1 and l2 are new lexical variables, and the LET*
;;;; form is given a binding (p (IF l2 l1 NIL)).
;;;;
;;;; Every &OPTIONAL parameter of the form (p <form>) is replaced by
;;;; (l1 NIL l2) where l1 and l2 are new lexical variables, and the
;;;; LET* form is given a binding (p (IF l2 l1 <form>)).
;;;;
;;;; Every &OPTIONAL parameter of the form (p <form> s) is replaced by
;;;; (l1 NIL l2) where l1 and l2 are new lexical variables, and the
;;;; LET* form is given bindings (p (IF l2 l1 <form>)) and (s l2).
;;;;
;;;; Every &KEY parameter of the form p or (p) is replaced by ((:p l1)
;;;; NIL l2) where l1 and l2 are new lexical variables, and the LET*
;;;; form is given a binding (p (IF l2 l1 NIL)).
;;;;
;;;; Every &KEY parameter of the form ((k p)) is replaced by ((k l1)
;;;; NIL l2) where l1 and l2 are new lexical variables, and the LET*
;;;; form is given a binding (p (IF l2 l1 NIL)).
;;;;
;;;; Every &KEY parameter of the form (p <form>) is replaced by ((:p
;;;; l1) NIL l2) where l1 and l2 are new lexical variables, and the
;;;; LET* form is given a binding (p (IF l2 l1 <form>)).
;;;;
;;;; Every &KEY parameter of the form ((k p) <form>) is replaced by
;;;; ((k l1) NIL l2) where l1 and l2 are new lexical variables, and
;;;; the LET* form is given a binding (p (IF l2 l1 <form>)).
;;;;
;;;; Every &KEY parameter of the form (p <form> s) is replaced by ((:p
;;;; l1) NIL l2) where l1 and l2 are new lexical variables, and the
;;;; LET* form is given bindings (p (IF l2 l1 <form>)) and (s l2).
;;;;
;;;; Every &KEY parameter of the form ((k p) <form> s) is replaced by
;;;; ((k l1) NIL l2) where l1 and l2 are new lexical variables, and
;;;; the LET* form is given bindings (p (IF l2 l1 <form>)) and (s l2).
;;;;
;;;; Every &AUX parameter of the form p or (p) is removed, and the
;;;; LET* form is given a binding (p NIL).
;;;;
;;;; Every &AUX parameter of the form (p <form>) removed, and the
;;;; LET* form is given a binding (p <form>).


(defclass lexify-lambda-list-client (client) ())

(defun required-parameter-ast-lexified-p (ast)
  (typep (ico:name-ast ast) 'ico:variable-definition-ast))

(defun required-section-lexified-p (required-section-ast)
  (or
    (null required-section-ast)
    (loop for parameter-ast in (ico:parameter-asts required-section-ast)
          always (required-parameter-ast-lexified-p parameter-ast))))
          
(defun optional-parameter-ast-lexified-p (ast)
  (let ((name-ast (ico:name-ast ast))
        (supplied-p-parameter-ast (ico:supplied-p-parameter-ast ast))
        (init-form-ast (ico:init-form-ast ast)))
    (and
      (typep name-ast 'ico:variable-definition-ast)
      (or
        (null init-form-ast)
        (and
          (typep init-form-ast 'ico:literal-ast)
          (null (ico:literal init-form-ast))))
      (not (null supplied-p-parameter-ast))
      (typep supplied-p-parameter-ast 'ico:variable-definition-ast))))
          
(defun key-parameter-ast-lexified-p (ast)
  (let ((name-ast (ico:name-ast ast))
        (supplied-p-parameter-ast (ico:supplied-p-parameter-ast ast))
        (init-form-ast (ico:init-form-ast ast)))
    (and
      (typep name-ast 'ico:variable-definition-ast)
      (or
        (null init-form-ast)
        (and
          (typep init-form-ast 'ico:literal-ast)
          (null (ico:literal init-form-ast))))
      (not (null supplied-p-parameter-ast))
      (typep supplied-p-parameter-ast 'ico:variable-definition-ast)
      (not (null (ico:keyword-ast ast))))))

(defun optional-section-lexified-p (optional-section-ast)
  (or
    (null optional-section-ast)
    (loop for ast in (ico:parameter-asts optional-section-ast)
          always (optional-parameter-ast-lexified-p ast))))

(defun rest-section-lexified-p (rest-section-ast)
  (or
    (null rest-section-ast)
    (typep (ico:name-ast (ico:parameter-ast rest-section-ast))
           'ico:variable-definition-ast)))

(defun key-section-lexified-p (key-section-ast)
  (or
    (null key-section-ast)
    (loop for ast in (ico:parameter-asts key-section-ast)
          always (key-parameter-ast-lexified-p ast))))

(defun aux-section-lexified-p (aux-section-ast)
  (or
    (null aux-section-ast)
    (null (ico:parameter-asts aux-section-ast))))

(defun lambda-list-lexified-p (lambda-list-ast)
  (and
    (required-section-lexified-p (ico:required-section-ast lambda-list-ast))
    (optional-section-lexified-p (ico:optional-section-ast lambda-list-ast))
    (rest-section-lexified-p (ico:rest-section-ast lambda-list-ast))
    (key-section-lexified-p (ico:key-section-ast lambda-list-ast))
    (aux-section-lexified-p (ico:aux-section-ast lambda-list-ast))))

(defun create-lexical-variable-pair ()
  (let* ((name (gensym))
         (definition (make-instance 'ico:variable-definition-ast
                       :name name))
         (reference (make-instance 'ico:variable-reference-ast
                      :name name
                      :definition-ast definition)))
    (reinitialize-instance definition
      :reference-asts (list reference))
    (values definition reference)))

(defun create-lexical-variable-triple ()
  (let* ((name (gensym))
         (definition (make-instance 'ico:variable-definition-ast
                       :name name))
         (reference-1 (make-instance 'ico:variable-reference-ast
                        :name name
                        :definition-ast definition))
         (reference-2 (make-instance 'ico:variable-reference-ast
                        :name name
                        :definition-ast definition)))
    (reinitialize-instance definition
      :reference-asts (list reference-1 reference-2))
    (values definition reference-1 reference-2)))

(defun lexify-required-parameter-ast (required-parameter-ast)
  (let ((existing-name-ast (ico:name-ast required-parameter-ast)))
    (multiple-value-bind (definition-ast reference-ast)
        (create-lexical-variable-pair)
      (reinitialize-instance required-parameter-ast
        :name-ast definition-ast)
      (make-instance 'ico:variable-binding-ast
        :variable-name-ast existing-name-ast
        :form-ast reference-ast))))

(defun lexify-required-section-ast (required-section-ast)
  (loop for parameter-ast in (ico:parameter-asts required-section-ast)
        collect (lexify-required-parameter-ast parameter-ast)))

(defun lexify-optional-parameter-ast (optional-parameter-ast)
  (let* ((existing-name-ast (ico:name-ast optional-parameter-ast))
         (init-form-ast (ico:init-form-ast optional-parameter-ast))
         (existing-supplied-p-ast
           (ico:supplied-p-parameter-ast optional-parameter-ast)))
    (multiple-value-bind (definition-1-ast reference-1-ast)
        (create-lexical-variable-pair)
      (reinitialize-instance optional-parameter-ast
        :name-ast definition-1-ast)
      (reinitialize-instance optional-parameter-ast
        :init-form-ast (make-instance 'ico:literal-ast :literal 'nil))
      (if (null existing-supplied-p-ast)
          (multiple-value-bind (definition-2-ast reference-2-ast)
              (create-lexical-variable-pair)
            (reinitialize-instance optional-parameter-ast
              :supplied-p-parameter-ast definition-2-ast)
            (list (make-instance 'ico:variable-binding-ast
                    :variable-name-ast existing-name-ast
                    :form-ast (make-instance 'ico:if-ast
                                :test-ast reference-2-ast
                                :then-ast reference-1-ast
                                :else-ast
                                (if (null init-form-ast)
                                    (make-instance 'ico:literal-ast
                                      :literal 'nil)
                                    init-form-ast)))))
          (multiple-value-bind
                (definition-2-ast reference-2.1-ast reference-2.2-ast)
              (create-lexical-variable-triple)
            (reinitialize-instance optional-parameter-ast
              :supplied-p-parameter-ast definition-2-ast)
            (list (make-instance 'ico:variable-binding-ast
                    :variable-name-ast existing-name-ast
                    :form-ast (make-instance 'ico:if-ast
                                :test-ast reference-2.1-ast
                                :then-ast reference-1-ast
                                :else-ast
                                (if (null init-form-ast)
                                    (make-instance 'ico:literal-ast
                                      :literal 'nil)
                                    init-form-ast)))
                  (make-instance 'ico:variable-binding-ast
                    :variable-name-ast existing-supplied-p-ast
                    :form-ast reference-2.2-ast)))))))

(defun lexify-optional-section-ast (optional-section-ast)
  (loop for parameter-ast in (ico:parameter-asts optional-section-ast)
        append (lexify-optional-parameter-ast parameter-ast)))

(defun lexify-rest-parameter-ast (rest-parameter-ast)
  (let ((existing-name-ast (ico:name-ast rest-parameter-ast)))
    (multiple-value-bind (definition-ast reference-ast)
        (create-lexical-variable-pair)
      (reinitialize-instance rest-parameter-ast
        :name-ast definition-ast)
      (make-instance 'ico:variable-binding-ast
        :variable-name-ast existing-name-ast
        :form-ast reference-ast))))

(defun lexify-rest-section-ast (rest-section-ast)
  (list (lexify-rest-parameter-ast (ico:parameter-ast rest-section-ast))))

(defun lexify-key-parameter-ast (key-parameter-ast)
  (let* ((existing-name-ast (ico:name-ast key-parameter-ast))
         (init-form-ast (ico:init-form-ast key-parameter-ast))
         (existing-supplied-p-ast
           (ico:supplied-p-parameter-ast key-parameter-ast))
         (keyword-ast (ico:keyword-ast key-parameter-ast)))
    ;; Make sure the keyword is given explicitly, since we are about
    ;; to change the main parameter.
    (when (null keyword-ast)
      (reinitialize-instance key-parameter-ast
        :keyword-ast
        (make-instance 'ico:literal-ast
          :literal (intern (string (ico:name existing-name-ast)) "KEYWORD"))))
    (multiple-value-bind (definition-1-ast reference-1-ast)
        (create-lexical-variable-pair)
      (reinitialize-instance key-parameter-ast
        :name-ast definition-1-ast)
      (reinitialize-instance key-parameter-ast
        :init-form-ast (make-instance 'ico:literal-ast :literal 'nil))
      (multiple-value-bind
            (definition-2-ast reference-2.1-ast reference-2.2-ast)
          (create-lexical-variable-triple)
        (reinitialize-instance key-parameter-ast
          :supplied-p-parameter-ast definition-2-ast)
        (list* (make-instance 'ico:variable-binding-ast
                 :variable-name-ast existing-name-ast
                 :form-ast (make-instance 'ico:if-ast
                             :test-ast reference-2.1-ast
                             :then-ast reference-1-ast
                             :else-ast
                             (if (null init-form-ast)
                                 (make-instance 'ico:literal-ast
                                   :literal 'nil)
                                 init-form-ast)))
               (if (null existing-supplied-p-ast)
                   '()
                   (list (make-instance 'ico:variable-binding-ast
                           :variable-name-ast existing-supplied-p-ast
                           :form-ast reference-2.2-ast))))))))

(defun lexify-key-section-ast (key-section-ast)
  (loop for parameter-ast in (ico:parameter-asts key-section-ast)
        append (lexify-key-parameter-ast parameter-ast)))

(defun lexify-aux-parameter-ast (aux-parameter-ast)
  (let ((name-ast (ico:name-ast aux-parameter-ast))
        (form-ast (ico:form-ast aux-parameter-ast)))
    (make-instance 'ico:variable-binding-ast
      :variable-name-ast name-ast
      :form-ast (if (null form-ast)
                    (make-instance 'ico:literal-ast :literal 'nil)
                    form-ast))))

(defun lexify-aux-section-ast (aux-section-ast)
  (loop for parameter-ast in (ico:parameter-asts aux-section-ast)
        collect (lexify-aux-parameter-ast parameter-ast)))

(defun ensure-lambda-list-lexified (ast)
  (let ((lambda-list-ast (ico:lambda-list-ast ast)))
    (unless (lambda-list-lexified-p lambda-list-ast)
      (let ((required-section-ast (ico:required-section-ast lambda-list-ast))
            (optional-section-ast (ico:optional-section-ast lambda-list-ast))
            (rest-section-ast (ico:rest-section-ast lambda-list-ast))
            (key-section-ast (ico:key-section-ast lambda-list-ast))
            (aux-section-ast (ico:aux-section-ast lambda-list-ast)))
        (let* ((binding-asts
                 (append
                  (if (null required-section-ast)
                      '()
                      (lexify-required-section-ast required-section-ast))
                  (if (null optional-section-ast)
                      '()
                      (lexify-optional-section-ast optional-section-ast))
                  (if (null rest-section-ast)
                      '()
                      (lexify-rest-section-ast rest-section-ast))
                  (if (null key-section-ast)
                      '()
                      (lexify-key-section-ast key-section-ast))
                  (if (null aux-section-ast)
                      '()
                      (prog1 (lexify-aux-section-ast aux-section-ast)
                        (reinitialize-instance lambda-list-ast
                          :aux-section-ast nil)))))
               (let*-ast
                 (make-instance 'ico:let*-ast
                   :binding-asts binding-asts
                   :declaration-asts (ico:declaration-asts ast)
                   :form-asts (ico:form-asts ast)
                   :origin (ico:origin lambda-list-ast))))
          (reinitialize-instance ast
            :declaration-asts '()
            :form-asts (list let*-ast))))))
  ast)

(defmethod iaw:walk-ast-node :around
    ((client lexify-lambda-list-client) (ast ico:lambda-expression-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (ensure-lambda-list-lexified ast)
  ast)

(defmethod iaw:walk-ast-node :around
    ((client lexify-lambda-list-client) (ast ico:local-function-ast))
  ;; Start by converting any children of this AST node.
  (call-next-method)
  (ensure-lambda-list-lexified ast)
  ast)
                  
(defun lexify-lambda-list (ast)
  (let ((client (make-instance 'lexify-lambda-list-client)))
    (iaw:walk-ast client ast)))
