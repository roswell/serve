(uiop/package:define-package :roswell.serve/main (:use :cl))
(in-package :roswell.serve/main)
;;;don't edit above
(defun module (name params)
  (let* ((imp (format nil "roswell.serve.~A" name))
         (symbol (ignore-errors
                  (ql:quickload imp :silent t)
                  (let (*read-eval*)
                    (read-from-string (format nil "~A/main::~A" imp name))))))
    (when symbol
      (apply symbol params))))

(defun entry (&rest r)
  (let ((type (position "--type" r :test 'equal)))
    (setf type (if type (nth (1+ type) r)
                   "swank"))
    (module type r))
  (loop (sleep 1)))
