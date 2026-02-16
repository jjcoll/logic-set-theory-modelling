;(A ⇒ B)  (¬A ⇒ B)  ¬B
; (a implies b) and (not a implies b) and not b

(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)

(assert (=> a b))
(assert (=> (not a) b))
(assert (not b))



(check-sat)
(get-model)

;UNSAT
