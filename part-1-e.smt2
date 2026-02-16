;Is it possible to find boolean values A,B,C such that the following holds?
;(not A or B) and A and not B = true

(declare-const a Bool)
(declare-const b Bool)

; each and can be treated as an assert
(assert (or (not a) b))
(assert a)
(assert (not b))


(check-sat)
(get-model)
