
(declare-const x Int)

(echo "Starting z3...")

; Corrected: Operator first, then variables
(assert (= 0 (+ 3066 (* 115 x)(+ (* x x)))))


(check-sat)
(get-model)
