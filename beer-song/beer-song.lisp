(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)
(defun verse (i)
  (if (> i 0)
    (format
      nil
      "~d bottle~p of beer on the wall, ~d bottle~p of beer.~&~
       Take ~a down and pass it around, ~a bottle~p of beer on the wall.~%"
       i i i i (if (eql i 1) "it" "one") (if (eql i 1) "no more" (1- i)) (1- i))
    (format
      nil
      "No more bottles of beer on the wall, no more bottles of beer.~&~
       Go to the store and buy some more, 99 bottles of beer on the wall.~%")))

(defun sing (start &optional (end 0))
  (format nil "~{~a~%~}" (loop for i from start downto end :collect (verse i))))
