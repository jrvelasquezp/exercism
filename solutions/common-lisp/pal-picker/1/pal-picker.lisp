(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun pal-picker (personality)
  (case personality
    (:lazy "Cat")
    (:energetic "Dog")
    (:quiet "Fish")
    (:hungry "Rabbit")
    (:talkative "Bird")
    (otherwise "I don't know... A dragon?"))
  )

(defun habitat-fitter (weight)
  (cond ((and (<= weight 9) (>= weight 1)) :small)
         ((<= weight 0) :just-your-imagination)
         ((and (<= weight 19) (>= weight 10)) :medium)
         ((and (<= weight 39) (>= weight 20)) :large)
         ((>= weight 40) :massive)
         )
  )


(defun feeding-time-p (fullness)
  (if (<= fullness 20) "It's feeding time!" "All is well.")
  )

(defun pet (pet)
  (equal pet "Fish")
  )

(defun play-fetch (pet)
  (not (equal pet "Dog"))
  )
