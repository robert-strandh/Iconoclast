(cl:in-package #:iconoclast-builder-test)

(define-test tagbody)

(define-test tagbody-empty
  :parent tagbody
  (compare-parse-and-unparse '(tagbody)))

(define-test tagbody-one-tag-no-forms
  :parent tagbody
  (compare-parse-and-unparse '(tagbody a)))
