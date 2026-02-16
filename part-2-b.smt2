;b) We have 5 integers X1, X2, X3, X4, X5.
;How to express that these are 5 different numbers?

(declare-const X1 Int)
(declare-const X2 Int)
(declare-const X3 Int)
(declare-const X4 Int)
(declare-const X5 Int)

(assert (distinct X1 X2 X3 X4 X5))

(check-sat)
(get-model)
