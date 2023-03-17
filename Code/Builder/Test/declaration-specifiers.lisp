(cl:in-package #:iconoclast-builder-test)

(defun test-dynamic-extent-1 ()
  (let ((result (bld::test '(locally (declare (dynamic-extent))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:dynamic-extent-ast ("name-asts" nil))))
                     ("form-asts" nil))))))

(defun test-dynamic-extent-2 ()
  (let ((result (bld::test '(locally (declare (dynamic-extent a))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:dynamic-extent-ast
                        ("name-asts"
                         ((ico:variable-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-dynamic-extent-3 ()
  (let ((result (bld::test '(locally (declare (dynamic-extent a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:dynamic-extent-ast
                        ("name-asts"
                         ((ico:variable-ast :name a)
                          (ico:variable-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-dynamic-extent-4 ()
  (let ((result
          (bld::test '(locally (declare (dynamic-extent a (function b)))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:dynamic-extent-ast
                        ("name-asts"
                         ((ico:variable-ast :name a)
                          (ico:function-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-dynamic-extent ()
  (format *trace-output* "Testing DYNAMIC-EXTENT~%")
  (test-dynamic-extent-1)
  (test-dynamic-extent-2)
  (test-dynamic-extent-3)
  (test-dynamic-extent-4))

(defun test-inline-1 ()
  (let ((result (bld::test '(locally (declare (inline))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:inline-ast ("name-asts" nil))))
                     ("form-asts" nil))))))

(defun test-inline-2 ()
  (let ((result (bld::test '(locally (declare (inline a))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:inline-ast
                        ("name-asts"
                         ((ico:function-name-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-inline-3 ()
  (let ((result (bld::test '(locally (declare (inline a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:inline-ast
                        ("name-asts"
                         ((ico:function-name-ast :name a)
                          (ico:function-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-inline ()
  (format *trace-output* "Testing INLINE~%")
  (test-inline-1)
  (test-inline-2)
  (test-inline-3))

(defun test-notinline-1 ()
  (let ((result (bld::test '(locally (declare (notinline))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:notinline-ast ("name-asts" nil))))
                     ("form-asts" nil))))))

(defun test-notinline-2 ()
  (let ((result (bld::test '(locally (declare (notinline a))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:notinline-ast
                        ("name-asts"
                         ((ico:function-name-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-notinline-3 ()
  (let ((result (bld::test '(locally (declare (notinline a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:notinline-ast
                        ("name-asts"
                         ((ico:function-name-ast :name a)
                          (ico:function-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-notinline ()
  (format *trace-output* "Testing NOTINLINE~%")
  (test-notinline-1)
  (test-notinline-2)
  (test-notinline-3))
