; Alphametic Puzzle Solver
; Rules:
; 1. Each letter maps to a unique digit (0-9)
; 2. The leftmost letter of any word cannot be zero
;
; Puzzle:
;     S E N D
;   + M O R E
;   ---------
;   M O N E Y
;
; Letter to variable mapping:
; S=a, E=b, N=c, D=d, M=e, O=f, R=g, Y=h
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)
(declare-const f Int)
(declare-const g Int)
(declare-const h Int)


; SEND  = 1000*a + 100*b + 10*c + d
; MORE  = 1000*e + 100*f + 10*g + b
; MONEY = 10000*e + 1000*f + 100*c + 10*b + h

; All mappings must be distinct
(assert (distinct a b c d e f g h))

; Each digit must be 0-9, but leading letters (S and M) cannot be 0
(assert (and(>= a 1) (<= a 9))) ; S (leading)
(assert (and(>= b 0) (<= b 9))) ; E
(assert (and(>= c 0) (<= c 9))) ; N
(assert (and(>= d 0) (<= d 9))) ; D
(assert (and(>= e 1) (<= e 9))) ; M (leading)
(assert (and(>= f 0) (<= f 9))) ; O
(assert (and(>= g 0) (<= g 9))) ; R
(assert (and(>= h 0) (<= h 9))) ; Y



; Arithmetic constraint: SEND + MORE = MONEY
(assert (= (+ (* 10000 e) (* 1000 f) (* 100 c) (* b 10) (* h 1)) (+ (+ (* 1000 e) (* 100 f) (* g 10) (* b 1)) (+ (* 1000 a) (* 100 b) (* c 10) (* d 1)))))

(check-sat)
(get-model)

