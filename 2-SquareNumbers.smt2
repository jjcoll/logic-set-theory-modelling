;Find three distinct natural numbers each pair of which sums up to a square (i.e. a number
;that is the square of some natural number).

(declare-const n1 Int)
(declare-const n2 Int)
(declare-const n3 Int)
(declare-const base1 Int )
(declare-const root1 Int)
(declare-const base2 Int )
(declare-const root2 Int)
(declare-const base3 Int )
(declare-const root3 Int)

; numbers are natural numbers
(assert (>= n1 0))
(assert (>= n2 0))
(assert (>= n3 0))

; numbers are distinct
(assert (distinct n1 n2 n3))

(assert (= root1 (+ n1 n2)))
(assert (= root2 (+ n1 n3)))
(assert (= root3 (+ n2 n3)))
(assert (= root1 (* base1 base1)))
(assert (= root2 (* base2 base2)))
(assert (= root3 (* base3 base3)))


(check-sat)
(get-model)

