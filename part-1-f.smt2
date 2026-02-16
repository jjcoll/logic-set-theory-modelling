;(A  B)  (¬A  C)  ¬(B  C)
; (a or B) and (not a or c) and not(b or c)

(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)

(assert (or a b))
(assert (or (not a) c))
(assert (not (or b c)))

(check-sat)
(get-model)

; UNSAT
