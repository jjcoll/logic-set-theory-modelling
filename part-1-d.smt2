(declare-const a Int)
(declare-const n Int)
(declare-const b Int)

; Set the number to test
(assert (= n 2778545904897799))

; 1. Must be a factor
;(assert (= (mod n a) 0)) --> avoid using mod as divission is slow
(assert (= n (* a b)))

; 2. Must be greater than 1 (to exclude 1)
(assert (> a 1))

; 3. The Square Root Limit (to exclude n itself and speed it up)
(assert (<= (* a a) n))

(check-sat)
(get-model)
