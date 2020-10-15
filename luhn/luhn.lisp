(in-package #:cl-user)
(defpackage #:luhn
  (:use #:cl)
  (:export #:validp))

(in-package #:luhn)

(defun validp (input)
  (if (valid-string-p input)
      (multiple-value-bind (nums nums-len) (string-to-numbers input)
        (if (> nums-len 1)
          (loop for i from (- nums-len 1) downto 0
            sum (if (evenp (- nums-len i))
                    (maybe-double (elt nums i))
                    (elt nums i)) into total
            finally (return (= 0 (mod total 10))))))))

(defun valid-string-p (input)
  (every (lambda (x) (or (digit-char-p x) (eql #\Space x))) input))

(defun maybe-double (n)
  (let ((n2 (* n 2))) (if (> n2 9) (- n2 9) n2)))

(defun string-to-numbers (num-str)
  (let ((nums (remove-if 'null (map 'list 'digit-char-p num-str))))
    (values nums (length nums))))
