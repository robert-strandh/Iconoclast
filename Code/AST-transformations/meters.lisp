(cl:in-package #:iconoclast-ast-transformations)

(defclass ast-meter ()
  ((%run-time :initform 0 :accessor run-time)
   (%invocation-count :initform 0 :accessor invocation-count)
   (%total-ast-size :initform 0 :accessor total-ast-size)))

(defun report (meter &optional (stream *standard-output*))
  (format stream
          "Invocation-count: ~s~%~@
           Total run time: ~s seconds~%~@
           Total AST size: ~s~%~@
           Run time per AST node: ~s seconds~%"
          (invocation-count meter)
          (/ (float (run-time meter))
             internal-time-units-per-second)
          (total-ast-size meter)
          (/ (float (run-time meter))
             internal-time-units-per-second
             (total-ast-size meter))))

(defgeneric invoke-with-ast-meter (meter ast thunk))

(defmethod invoke-with-ast-meter (meter ast thunk)
  (let ((run-time-before (get-internal-run-time))
        (ast-size (ast-size ast)))
    (multiple-value-prog1 (funcall thunk)
      (incf (run-time meter)
            (- (get-internal-run-time) run-time-before))
      (incf (total-ast-size meter) ast-size)
      (incf (invocation-count meter)))))

(defmacro with-ast-meter ((meter ast) &body body)
  `(invoke-with-ast-meter ,meter ,ast (lambda () ,@body)))
