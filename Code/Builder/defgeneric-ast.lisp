(cl:in-package #:iconoclast-builder)

(define-make-node-method :defgeneric ico:defgeneric-ast)

(define-relations ico:defgeneric-ast
  ((:name ico:function-name-ast ico:name-ast)
   (:argument-precedence-order t ico:argument-precedence-order-asts)
   (:generic-function-class t ico:generic-function-class-ast)
   (:method-class t ico:method-class-ast)))

;;; The following code doesn't really work, and we expect an overhaul
;;; of the method-combination option for DEFGENERIC anyway, so it is
;;; commented out.

;; (define-make-node-method :method-combination-name ico:name-ast)

;; (defmethod abp:relate
;;     ((builder builder)
;;      (relation (eql :method-combination))
;;      (left ico:defgeneric-ast)
;;      (right ico:name-ast)
;;      &key)
;;   (reinitialize-instance
;;       left
;;     :method-combination-name-and-arguments-ast
;;     (make-instance 'ico:method-combination-name-and-arguments-ast
;;       :name-ast right)))

;; (defmethod abp:relate
;;     ((builder builder)
;;      (relation (eql :method-combination-argument))
;;      (left ico:defgeneric-ast)
;;      (right t)
;;      &key)
;;   (reinitialize-instance
;;       (ico:method-combination-name-and-arguments-ast left)
;;     :method-combination-arguments
;;     (append (ico:method-combination-arguments
;;              (ico:method-combination-name-and-arguments-ast left))
;;      (list right)))
;;   left)

;; (define-make-node-method :method-description ico:method-description-ast)

;; (define-relations ico:defgeneric-ast
;;   ((:method ico:method-description-ast ico:method-description-asts)))
