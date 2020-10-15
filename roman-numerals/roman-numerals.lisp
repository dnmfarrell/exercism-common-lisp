(defpackage #:roman
  (:use #:cl)
  (:export #:romanize))

(in-package #:roman)
(defconstant +numerals+
             (apply #'vector
                    (mapcar #'(lambda (x) (format nil "~@r" x))
                            (loop for i from 1 to 3000 collect i)))
             "All the Roman numerals you'll ever need")

(defun romanize (n)
  "Faster than 'format nil \"~@r\"' 👅"
  (svref +numerals+ (- n 1)))
