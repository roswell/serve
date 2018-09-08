(uiop/package:define-package :roswell.serve.swank/main (:use :cl))
(in-package :roswell.serve.swank/main)
;;;don't edit above

(defun swank (&rest r)
  (swank:create-server :port 0))
