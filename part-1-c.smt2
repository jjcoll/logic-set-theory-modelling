(declare-const me_now Int)
(declare-const brother_now Int)
(declare-const me_past Int)
(declare-const brother_past Int)

; 1. "If I am 20 years old"
(assert (= me_now 20))

; 2. "when I was as old as he is now" (Defining the past point)
(assert (= me_past brother_now))

; 3. "I am twice as old as my brother was [then]"
(assert (= me_now (* 2 brother_past)))

; 4. The Time Gap Rule: The difference in age stays constant over time
(assert (= (- me_now brother_now) (- me_past brother_past)))

(check-sat)
(get-model)
