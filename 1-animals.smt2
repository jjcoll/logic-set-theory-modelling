;You must spend exactly 400 euro and buy exactly 100 animals. A dog costs 60 euro, a cat 4
;euro and a mouse 1 euro each. You have to buy at least one of each. How many of each
;should you buy?

; at least one of each
; buy exactly 100
; spend 400

(declare-const n_cat Int )
(declare-const n_dog Int)
(declare-const n_mouse Int)
(declare-const c_cat Int)
(declare-const c_dog Int)
(declare-const c_mouse Int)

; set the costs of each 
(assert (= c_dog 60))
(assert (= c_cat 4))
(assert (= c_mouse 1))

; total cost equal to 400 
(assert (= 400 (+ (* n_cat c_cat) (* c_dog n_dog) (* c_mouse n_mouse))))

; total number animals
(assert (= 100 (+ n_cat n_dog n_mouse)))

; at least one of each
(assert (>= n_cat 1))
(assert (>= n_dog 1))
(assert (>= n_mouse 1))

(check-sat)
(get-model)

;SAT n_cat=41 n_mouse=56 n_dog=3

