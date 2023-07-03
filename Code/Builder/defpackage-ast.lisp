(cl:in-package #:iconoclast-builder)

(define-make-node-method :defpackage ico:defpackage-ast)

(define-relations ico:defpackage-ast
  ((:use t ico:use-asts)
  (:nickname t ico:nickname-asts)
  (:export t ico:export-asts)
  (:intern t ico:intern-asts)
  (:shadow t ico:shadow-asts)
  (:import-from t ico:import-from-asts)
  (:shadowing-import-from t ico:shadowing-import-from-asts)
  (:size t ico:size-ast)))

(define-make-node-method :import-from ico:import-from-ast)

(define-relations ico:import-from-ast
  ((:package t ico:package-name-ast)
   (:name t ico:name-asts)))
