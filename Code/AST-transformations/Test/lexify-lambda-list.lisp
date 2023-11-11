(cl:in-package #:iconoclast-ast-transformations-test)

(defun parse-lexify-and-unparse (lambda-application)
  (parse-transform-and-unparse lambda-application #'iat:lexify-lambda-list))

(define-test lexify-lambda-list)

(define-test lexify-lambda-list-one-required-special
  :parent lexify-lambda-list
  (is #'forms-similar-p
      `(labels ((f (#1=#:a)
                  (let* ((x #1#)) (declare (special x)) 234))))
      (parse-lexify-and-unparse
       '(labels ((f (x) (declare (special x)) 234))))))

(define-test lexify-lambda-list-one-optional-special
  :parent lexify-lambda-list
  (is #'forms-similar-p
      `(labels ((f (&optional (#1=#:a nil #2=#:a-p))
                  (let* ((x (if #2# #1# nil))
                         (x-p #2#))
                    (declare (special x))
                    234))))
      (parse-lexify-and-unparse
       '(labels ((f (&optional (x nil x-p))
                  (declare (special x))
                  234))))))

(define-test lexify-lambda-list-one-optional-supplied-p-special
  :parent lexify-lambda-list
  (is #'forms-similar-p
      `(labels ((f (&optional (#1=#:a nil #2=#:a-p))
                  (let* ((x (if #2# #1# nil))
                         (x-p #2#))
                    (declare (special x-p))
                    234))))
      (parse-lexify-and-unparse
       '(labels ((f (&optional (x nil x-p))
                  (declare (special x-p))
                  234))))))

(define-test lexify-lambda-list-one-key-special
  :parent lexify-lambda-list
  (is #'forms-similar-p
      `(labels ((f (&key ((:x #1=#:a) nil #2=#:a-p))
                  (let* ((x (if #2# #1# nil))
                         (x-p #2#))
                    (declare (special x))
                    234))))
      (parse-lexify-and-unparse
       '(labels ((f (&key (x nil x-p))
                  (declare (special x))
                  234))))))

(define-test lexify-lambda-list-one-key-supplied-p-special
  :parent lexify-lambda-list
  (is #'forms-similar-p
      `(labels ((f (&key ((:x #1=#:a) nil #2=#:a-p))
                  (let* ((x (if #2# #1# nil))
                         (x-p #2#))
                    (declare (special x-p))
                    234))))
      (parse-lexify-and-unparse
       '(labels ((f (&key (x nil x-p))
                  (declare (special x-p))
                  234))))))

(define-test lexify-lambda-list-rest-special
  :parent lexify-lambda-list
  (is #'forms-similar-p
      `(labels ((f (&rest #1=#:a)
                  (let* ((x #1#))
                    (declare (special x))
                    234))))
      (parse-lexify-and-unparse
       '(labels ((f (&rest x)
                  (declare (special x))
                  234))))))

(define-test lexify-lambda-list-already-lexified-no-parameters
  :parent lexify-lambda-list
  (is #'equal
      '(labels ((f () 234)))
      (parse-lexify-and-unparse '(labels ((f () 234))))))

(define-test lexify-lambda-list-already-lexified-one-required-parameter
  :parent lexify-lambda-list
  (is #'equal
      '(labels ((f (x) 234)))
      (parse-lexify-and-unparse '(labels ((f (x) 234))))))

(define-test lexify-lambda-list-already-lexified-one-optional-parameter
  :parent lexify-lambda-list
  (is #'equal
      '(labels ((f (&optional (x nil x-p)) 234)))
      (parse-lexify-and-unparse
       '(labels ((f (&optional (x nil x-p)) 234))))))

(define-test lexify-lambda-list-not-lexified-one-optional-parameter
  :parent lexify-lambda-list
  (is #'forms-similar-p
      '(labels ((f (&optional (#1=#:a nil #2=#:a-p))
                 (let* ((x (if #2# #1# nil)))
                   234))))
      (parse-lexify-and-unparse '(labels ((f (&optional x) 234))))))

(define-test lexify-lambda-list-already-lexified-one-key-parameter
  :parent lexify-lambda-list
  (is #'equal
      '(labels ((f (&key (x nil x-p)) 234)))
      (parse-lexify-and-unparse '(labels ((f (&key (x nil x-p)) 234))))))

(define-test lexify-lambda-list-one-aux-parameter
  :parent lexify-lambda-list
  (is #'equal
      '(labels ((f () (let* ((x 123)) 234))))
      (parse-lexify-and-unparse '(labels ((f (&aux (x 123)) 234))))))
