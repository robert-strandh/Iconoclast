(cl:in-package #:iconoclast-builder-test)

(defun test-tagbody-1 ()
  (run-test
   '(tagbody)
   '(ico:tagbody-ast ("segment-asts" nil))))

(defun test-tagbody-2 ()
  (run-test
   '(tagbody a)
   '(ico:tagbody-ast
     ("segment-asts"
      ((ico:tagbody-segment-ast
        ("form-asts" nil)
        ("tag-ast" (ico:tag-ast :name a))))))))

(defun test-tagbody ()
  (format *trace-output* "Testing TAGBODY~%")
  (test-tagbody-1)
  (test-tagbody-2))
