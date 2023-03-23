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
                         ((ico:variable-name-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-dynamic-extent-3 ()
  (let ((result (bld::test '(locally (declare (dynamic-extent a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:dynamic-extent-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
                          (ico:variable-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-dynamic-extent-4 ()
  (let ((result
          (bld::test '(locally (declare (dynamic-extent a (function b)))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:dynamic-extent-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
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

(defun test-ignore-1 ()
  (let ((result (bld::test '(locally (declare (ignore))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignore-ast ("name-asts" nil))))
                     ("form-asts" nil))))))

(defun test-ignore-2 ()
  (let ((result (bld::test '(locally (declare (ignore a))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignore-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-ignore-3 ()
  (let ((result (bld::test '(locally (declare (ignore a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignore-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
                          (ico:variable-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-ignore-4 ()
  (let ((result
          (bld::test '(locally (declare (ignore a (function b)))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignore-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
                          (ico:function-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-ignore ()
  (format *trace-output* "Testing IGNORE~%")
  (test-ignore-1)
  (test-ignore-2)
  (test-ignore-3)
  (test-ignore-4))

(defun test-ignorable-1 ()
  (let ((result (bld::test '(locally (declare (ignorable))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignorable-ast ("name-asts" nil))))
                     ("form-asts" nil))))))

(defun test-ignorable-2 ()
  (let ((result (bld::test '(locally (declare (ignorable a))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignorable-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-ignorable-3 ()
  (let ((result (bld::test '(locally (declare (ignorable a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignorable-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
                          (ico:variable-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-ignorable-4 ()
  (let ((result
          (bld::test '(locally (declare (ignorable a (function b)))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:ignorable-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
                          (ico:function-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-ignorable ()
  (format *trace-output* "Testing IGNORABLE~%")
  (test-ignorable-1)
  (test-ignorable-2)
  (test-ignorable-3)
  (test-ignorable-4))

(defun test-special-1 ()
  (let ((result (bld::test '(locally (declare (special))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:special-ast ("name-asts" nil))))
                     ("form-asts" nil))))))

(defun test-special-2 ()
  (let ((result (bld::test '(locally (declare (special a))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:special-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a))))))
                     ("form-asts" nil))))))

(defun test-special-3 ()
  (let ((result (bld::test '(locally (declare (special a b))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:special-ast
                        ("name-asts"
                         ((ico:variable-name-ast :name a)
                          (ico:variable-name-ast :name b))))))
                     ("form-asts" nil))))))

(defun test-special ()
  (format *trace-output* "Testing SPECIAL~%")
  (test-special-1)
  (test-special-2)
  (test-special-3))
