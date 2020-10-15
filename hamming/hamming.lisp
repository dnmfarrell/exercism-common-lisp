(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(in-package #:hamming)

(defun distance (dna1 dna2)
  (if (= (length dna1) (length dna2))
      (count nil (map 'list 'eql dna1 dna2))))
