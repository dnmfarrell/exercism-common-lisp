(in-package #:cl-user)
(defpackage #:word-count
  (:use #:cl)
  (:export #:count-words))
(in-package #:word-count)

(defun count-words (sentence)
  (sentence-to-words
    (concatenate 'string
                 (substitute-if-not #\Space
                                  'legal-char-p 
                                  (string-downcase sentence))
                 " ")))                                      ; our delimiter

(defun sentence-to-words (sentence)
  (loop for c across sentence with word = "" with word-counts
        do (cond ((legal-char-p c)
                  (setf word (concatenate 'string word (list c))))
                 ((> (length word) 0)
                  (setf word-t (string-trim '(#\') word) word "")
                  (if (assoc word-t word-counts :test #'equal) 
                      (incf (cdr (assoc word-t word-counts :test #'equal)))
                      (setf word-counts (acons word-t 1 word-counts)))))
        finally (return word-counts)))

(defun legal-char-p (c)
  (or (alphanumericp c) (char= c #\')))
