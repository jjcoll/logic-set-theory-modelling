(declare-const p Int)
(declare-const q Int)

(echo "Starting z3...")

; Corrected: Operator first, then variables
(assert (and (= 37 (+ p q)) (= 286 (* p q))))

(check-sat)
(get-model)
