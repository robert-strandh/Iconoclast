(cl:in-package #:iconoclast-builder-test)

(defmacro run-test (form expected-result)
  `(let* ((result (bld::test ,form))
          (conversion (convert-ast result)))
     (unless (equal conversion ,expected-result)
       (format t "Test failed for: ~s~%" ,form)
       (format t "Excpected result was: ~s~%" ,expected-result)
       (format t "But got instead: ~s~%" conversion))))
