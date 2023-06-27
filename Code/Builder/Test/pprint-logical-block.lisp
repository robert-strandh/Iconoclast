(cl:in-package #:iconoclast-builder-test)

(define-test pprint-logical-block)

(define-test pprint-logical-block-required
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b))))

(define-test pprint-logical-block-one-keyword-argument
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b c d))))

(define-test pprint-logical-block-two-keyword-arguments
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b c d e f))))

(define-test pprint-logical-block-three-keyword-arguments
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b c d e f g h))))

(define-test pprint-logical-block-four-keyword-arguments
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b c d e f g h i j))))

(define-test pprint-logical-block-declaration
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b) (declare (inline f)))))

(define-test pprint-logical-block-one-form
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b) c)))

(define-test pprint-logical-block-two-forms
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b) c d)))
