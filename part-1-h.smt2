;(a implies b) and not(b implies a)


(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)

(assert (=> a b))
(assert (not (=> b a)))


(check-sat)
(get-model)

; a = false, b = true
