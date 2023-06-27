(cl:in-package #:iconoclast-builder-test)

(define-test pprint-logical-block)

(define-test pprint-logical-block-required
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b))))

(define-test pprint-logical-block-prefix
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b :prefix c))))

(define-test pprint-logical-block-per-line-prefix
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b :per-line-prefix c))))

(define-test pprint-logical-block-suffix
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b :suffix c))))

(define-test pprint-logical-block-suffix-twice
  :parent pprint-logical-block
  (compare-parse-and-unparse
   '(pprint-logical-block (a b :suffix c :suffix d))))

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
