;c) We have booleans A, B, C and D.
;How to express the condition that exactly one of them is true?



; the idea here is to once again use type casting bool -> int
(declare-const A Bool )
(declare-const B Bool)
(declare-const C Bool)
(declare-const D Bool)

(assert (= 1 (+ 
  (ite A 1 0)
  (ite B 1 0)
  (ite C 1 0) 
  (ite D 1 0) 
)))



(check-sat)
(get-model)
