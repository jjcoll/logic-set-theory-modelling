; We have booleans A, B, C, D and integer N.
;How to express:
;‘N is equal to the number of booleans (from these 4) that are true?’

(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)
(declare-const n Int)

; we use typecasting here, where we use if then else 
; and use the result for an addition operation
(assert(= n (+ 
  (ite a 1 0)
  (ite b 1 0)
  (ite c 1 0)
  (ite d 1 0)
)))

(assert (= 2 n ))

(check-sat)
(get-model)
