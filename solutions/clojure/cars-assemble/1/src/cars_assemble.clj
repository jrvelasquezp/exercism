(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
   (cond
    (= speed 0) 0.0
    (<= speed 4) (* speed (* 221.0 1.0))
    (<= speed 8) (* speed (* 221.0 0.9))
    (= speed 9) (* speed (* 221.0 0.8))
    (= speed 10) (- (* (* 221.0 0.77) speed) 0.0000000000003)
   )
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int(/ (production-rate speed) 60))
  )
