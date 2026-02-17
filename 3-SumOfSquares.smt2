;We have two positive integers, take the sum of their squares and multiply the result by 2.
;Can this number be itself the sum of two squares (of integers)?

;two positive ints, n1 & n2 
;sum of their squares * 2 lets call it x
;can x this number be sum of two squares (ints)

(declare-const n1 Int)
(declare-const n2 Int)
(declare-const x1 Int)
(declare-const x2 Int)
(declare-const sum_squares Int)
(declare-const x1_base Int)
(declare-const x2_base Int)

; positive integers
(assert (> n1 0))
(assert (> n2 0))
(assert (> x1 0))
(assert (> x2 0))

; sum of two suares * 2

(assert (= sum_squares(* 2 
  (+
    (* n1 n1) 
    (* n2 n2)
  )
)))

; sum of two squares
(assert (= sum_squares (+ x1 x2)))

; x1 & x2 are squared numbers
(assert (= x1 (* x1_base x1_base)))
(assert (= x2 (* x2_base x2_base)))

(check-sat)
(get-model)

; SAT


