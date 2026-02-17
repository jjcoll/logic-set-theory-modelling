;Let Z3 solve alphametic puzzles.
;There are two rules
;The leftmost letter can't be zero in any word.
;There must be a one-to-one mapping between letters and digits.
;If M is 6 all Ms are 6 and no other letter can be 6 

; CONDITIONS 
; all letters in string must have different integer mapping
; left most letter can't be 0


;    I       S E N D
;+ B B     + M O R E
;-----     ---------
;I L L     M O N E Y


; Mappings
; S E N D M O R Y
; a b c d e f g h
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)
(declare-const f Int)
(declare-const g Int)
(declare-const h Int)


; Word 1
;S -> a * 1000
;E -> b * 100
;N -> c * 10
;D -> d * 1
; arithmetic
;(+ (* 1000 a) (* 100 b) (* c 10) (* d 1))

; Word 2
;M -> e * 1000
;O -> f * 100
;R -> g * 10
;E -> b * 1
; arithmetic expression
;(+ (* 1000 e) (* 100 f) (* g 10) (* b 1))
 
; Answer
;M -> e * 10000
;O -> f * 1000
;N -> c * 100
;E -> b * 10
;Y -> h * 1
; arithmetic expression
;(+ (* 10000 e) (* 1000 f) (* 100 c) (* b 10) (* h 1))

; All mappings must be distinct
(assert (distinct a b c d e f g h))

; All mappings must be numbers between 0-9 & first letters > 0
(assert (and(>= a 1) (<= a 9))); first letter
(assert (and(>= b 0) (<= b 9)))
(assert (and(>= c 0) (<= c 9)))
(assert (and(>= d 0) (<= d 9)))
(assert (and(>= e 1) (<= e 9))) ; first letter
(assert (and(>= f 0) (<= f 9)))
(assert (and(>= g 0) (<= g 9)))
(assert (and(>= h 0) (<= h 9)))



;Arithmetic exrpssion
(assert (= (+ (* 10000 e) (* 1000 f) (* 100 c) (* b 10) (* h 1)) (+ (+ (* 1000 e) (* 100 f) (* g 10) (* b 1)) (+ (* 1000 a) (* 100 b) (* c 10) (* d 1)))))

(check-sat)
(get-model)

; SAT


