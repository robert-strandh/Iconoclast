(cl:in-package #:iconoclast-builder-test)

(defun test ()
  ;; We want to test LOCALLY early, because it is a very simple
  ;; special form, and we want to use it later to test various
  ;; declarations without too much noise around.
  (test-locally)
  (test-the))
