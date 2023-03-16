(cl:in-package #:iconoclast-builder-test)

(defun test-return-from-1 ()
  (let ((result (bld::test '(return-from hello))))
    (assert (equal (convert-ast result)
                   '(ico:return-from-ast
                     ("block-ast" (ico:block-name-ast :name hello))
                     ("form-ast" nil))))))

(defun test-return-from ()
  (format *trace-output* "Testing RETURN-FROM~%")
  (test-return-from-1))
