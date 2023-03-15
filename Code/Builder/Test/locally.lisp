(cl:in-package #:iconoclast-builder-test)

;;; FIXME: test that the list of FORM-ASTs is empty as well, but
;;; currently it is not, so wait with that introduction.
(defun test-locally-1 ()
  (let ((result (bld::test '(locally ()))))
    (assert (null (ico:declaration-asts result)))))

(defun test-locally ()
  (test-locally-1))
