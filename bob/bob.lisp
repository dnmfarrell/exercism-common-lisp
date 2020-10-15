(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response))
(in-package #:bob)

(defun response (hey)
  (setf hey
        (remove-if-not (lambda (c) (or (alphanumericp c) (eql #\? c))) hey))
  (cond ((equal "" hey) "Fine. Be that way!")
        ((and (all-caps-p hey) (question-p hey)) "Calm down, I know what I'm doing!")
        ((all-caps-p hey) "Whoa, chill out!")
        ((question-p hey) "Sure.")
        (t "Whatever.")))

(defun all-caps-p (hey)
  (and (find-if #'alpha-char-p hey) (string= hey (string-upcase hey))))

(defun question-p (hey)
  (= (or (position #\? hey) -1) (- (length hey) 1)))
