(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))

(in-package #:rna-transcription)

(defun to-rna (str)
  (map 'string
       (lambda (c)
         (ecase c (#\G #\C)
                  (#\C #\G)
                  (#\T #\A)
                  (#\A #\U)))
       str))
