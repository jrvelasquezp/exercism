(ns leap)

(defn leap-year? [year] ;; <- argslist goes here
  ;; your code goes here
  (and (= (rem year 4) 0) (or (= (rem year 400) 0) (> (rem year 100) 0)))
)
