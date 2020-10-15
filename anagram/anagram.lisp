(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)
(defun anagrams-for (word candidates)
  (remove-if-not
      #'(lambda (candidate)
          (and 
            (not (string-equal candidate word))
            (string-equal (sort (copy-seq candidate) #'char-lessp)
                          (sort (copy-seq word) #'char-lessp))
            ))
      candidates))
