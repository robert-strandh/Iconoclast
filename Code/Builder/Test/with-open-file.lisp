(cl:in-package #:iconoclast-builder-test)

(define-test with-open-file)

(define-test with-open-file-empty
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y))))

(define-test with-open-file-direction-input
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :direction :input))))

(define-test with-open-file-direction-output
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :direction :output))))

(define-test with-open-file-direction-io
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :direction :io))))

(define-test with-open-file-direction-probe
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :direction :probe))))

(define-test with-open-file-element-type-default
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :element-type :default))))

(define-test with-open-file-element-type-other
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :element-type z))))

(define-test with-open-file-if-exists-error
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :error))))

(define-test with-open-file-if-exists-new-version
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :new-version))))

(define-test with-open-file-if-exists-rename
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :rename))))

(define-test with-open-file-if-exists-rename-and-delete
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :rename-and-delete))))

(define-test with-open-file-if-exists-overwrite
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :overwrite))))

(define-test with-open-file-if-exists-append
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :append))))

(define-test with-open-file-if-exists-supersede
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists :supersede))))

(define-test with-open-file-if-exists-nil
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-exists nil))))

(define-test with-open-file-if-does-not-exist-error
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-does-not-exist :error))))

(define-test with-open-file-if-does-not-exist-create
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-does-not-exist :create))))

(define-test with-open-file-if-does-not-exist-nil
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :if-does-not-exist nil))))

(define-test with-open-file-external-format-default
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y :external-format :default))))

(define-test with-open-file-declaraton
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y) (declare (inline f)))))

(define-test with-open-file-one-body-form
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y) z)))

(define-test with-open-file-two-body-forms
  :parent with-open-file
  (compare-parse-and-unparse
   '(with-open-file (x y) z w)))
