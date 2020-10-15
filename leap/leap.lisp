(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  (if (eql (mod year 4) 0)
    (or (eql (mod year 400) 0)
        (not (eql (mod year 100) 0)))))
