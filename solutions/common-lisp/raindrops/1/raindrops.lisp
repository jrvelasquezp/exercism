(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  (if (not(or (= 0 (mod n 3)) (= 0 (mod n 5)) (= 0 (mod n 7)))) (format nil "~d" n) (concatenate 'string (if (= 0 (mod n 3)) "Pling") (if (= 0 (mod n 5)) "Plang") (if (= 0 (mod n 7)) "Plong")))
  )
