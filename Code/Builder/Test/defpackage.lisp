(cl:in-package #:iconoclast-builder-test)

(define-test defpackage)

(define-test defpackage-only-name-string
  :parent defpackage
  (compare-parse-and-unparse '(defpackage "hello")))

(define-test defpackage-only-name-symbol
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO")
      (parse-and-unparse '(defpackage hello))))

(define-test defpackage-only-name-character
  :parent defpackage
  (is #'equal
      '(defpackage "a")
      (parse-and-unparse '(defpackage #\a))))

(define-test defpackage-nicknames
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:nicknames "A" "B"))
      (parse-and-unparse '(defpackage hello (:nicknames a b)))))

(define-test defpackage-documentation
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:documentation "hello"))
      (parse-and-unparse '(defpackage hello (:documentation "hello")))))

(define-test defpackage-use
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:use "X" "Y"))
      (parse-and-unparse '(defpackage hello (:use x y)))))

(define-test defpackage-shadown
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:shadow "X" "Y"))
      (parse-and-unparse '(defpackage hello (:shadow x y)))))

(define-test defpackage-import-from
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:import-from "A" "B" "C"))
      (parse-and-unparse '(defpackage hello (:import-from a b c)))))

(define-test defpackage-shadowing-import
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:shadowing-import-from "A" "B" "C"))
      (parse-and-unparse
       '(defpackage hello (:shadowing-import-from a b c)))))

(define-test defpackage-export
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:export "A" "B"))
      (parse-and-unparse '(defpackage hello (:export a b)))))

(define-test defpackage-intern
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:intern "A" "B"))
      (parse-and-unparse '(defpackage hello (:intern a b)))))

(define-test defpackage-size
  :parent defpackage
  (is #'equal
      '(defpackage "HELLO" (:size 234))
      (parse-and-unparse '(defpackage hello (:size 234)))))
