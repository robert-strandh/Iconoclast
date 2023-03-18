(cl:in-package #:iconoclast-builder-test)

(defun test-type-1 ()
  (let ((result (bld::test '(the fixnum a))))
    (assert (equal (convert-ast result)
                   '(ico:the-ast
                     ("form-ast" (bld:unparsed-form-ast :form a))
                     ("value-type-ast"
                      (ico:atomic-type-specifier-ast
                       ("name-ast" (ico:type-name-ast :name fixnum)))))))))

(defun test-type-2 ()
  (let ((result (bld::test '(the (integer 2 3) a))))
    (assert (equal (convert-ast result)
                   '(ico:the-ast
                     ("form-ast" (bld:unparsed-form-ast :form a))
                     ("value-type-ast"
                      (ico:compound-type-specifier-ast
                       ("atomic-type-specifier-ast" nil)
                       ("name-ast" (ico:type-name-ast :name integer))
                       ("subsidiary-item-asts"
                        ((ico:subsidiary-item-ast :value 2)
                         (ico:subsidiary-item-ast :value 3))))))))))

(defun test-type ()
  (format *trace-output* "Testing TYPE~%")
  (test-type-1)
  (test-type-2))
