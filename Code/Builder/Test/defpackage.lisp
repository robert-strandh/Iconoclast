(cl:in-package #:iconoclast-builder-test)

(define-test defpackage)

(define-test defpackage-only-name-string
  :parent defpackage
  (compare-parse-and-unparse '(defpackage "hello")))

(define-test defpackage-only-name-symbol
  :parent defpackage
  (compare-parse-and-unparse '(defpackage hello)))

(define-test defpackage-only-name-character
  :parent defpackage
  (compare-parse-and-unparse '(defpackage #\a)))

(define-test defpackage-nicknames
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:nicknames a b))))

(define-test defpackage-documentation
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:documentation "hello"))))

(define-test defpackage-use
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:use x y))))

(define-test defpackage-shadown
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:shadow x y))))

(define-test defpackage-import-from
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:import-from a b c))))

(define-test defpackage-shadowing-import
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:shadowing-import-from a b c))))

(define-test defpackage-export
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:export a b))))

(define-test defpackage-intern
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:intern a b))))

(define-test defpackage-size
  :parent defpackage
  (compare-parse-and-unparse
   '(defpackage hello (:size f))))
