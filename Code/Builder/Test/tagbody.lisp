(cl:in-package #:iconoclast-builder-test)

(defun test-tagbody-1 ()
  (let ((result (bld::test '(tagbody))))
    (assert (equal (convert-ast result)
                   '(ico:tagbody-ast ("segment-asts" nil))))))

(defun test-tagbody ()
  (format *trace-output* "Testing TAGBODY~%")
  (test-tagbody-1))
