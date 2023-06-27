(cl:in-package #:iconoclast-builder-test)

(define-test print-unreadable-object)

(define-test print-unreadable-object-empty
  :parent print-unreadable-object
  (compare-parse-and-unparse
   '(print-unreadable-object (a b))))

(define-test print-unreadable-object-type
  :parent print-unreadable-object
  (compare-parse-and-unparse
   '(print-unreadable-object (a b :type x))))

(define-test print-unreadable-object-identity
  :parent print-unreadable-object
  (compare-parse-and-unparse
   '(print-unreadable-object (a b :identity x))))

(define-test print-unreadable-object-multiple-keyword-arguments
  :parent print-unreadable-object
  (compare-parse-and-unparse
   '(print-unreadable-object (a b :type c :identity d :type e))))

(define-test print-unreadable-object-one-form
  :parent print-unreadable-object
  (compare-parse-and-unparse
   '(print-unreadable-object (a b) c)))

(define-test print-unreadable-object-two-forms
  :parent print-unreadable-object
  (compare-parse-and-unparse
   '(print-unreadable-object (a b) c d)))
