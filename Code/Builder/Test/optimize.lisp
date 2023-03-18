(cl:in-package #:iconoclast-builder-test)

(defun test-optimize-1 ()
  (let ((result (bld::test '(locally (declare (optimize))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:optimize-ast ("quality-asts" nil))))
                     ("form-asts" nil))))))

(defun test-optimize-2 ()
  (let ((result (bld::test '(locally (declare (optimize speed))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:optimize-ast
                        ("quality-asts"
                         ((ico:speed-ast :value nil))))))
                     ("form-asts" nil))))))

(defun test-optimize-3 ()
  (let ((result (bld::test '(locally (declare (optimize (speed 1)))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:optimize-ast
                        ("quality-asts"
                         ((ico:speed-ast :value 1))))))
                     ("form-asts" nil))))))

(defun test-optimize-4 ()
  (let ((result
          (bld::test '(locally (declare (optimize (speed 1) (safety 0)))))))
    (assert (equal (convert-ast result)
                   '(ico:locally-ast
                     ("declaration-asts"
                      ((ico:optimize-ast
                        ("quality-asts"
                         ((ico:speed-ast :value 1)
                          (ico:safety-ast :value 0))))))
                     ("form-asts" nil))))))

(defun test-optimize ()
  (format *trace-output* "Testing OPTIMIZE~%")
  (test-optimize-1)
  (test-optimize-2)
  (test-optimize-3)
  (test-optimize-4))
