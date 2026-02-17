# Z3 / SMT-LIB Basic Syntax

### 1. The Core Logic

SMT-LIB uses **Lisp-style prefix notation** (S-expressions). Erything is wrapped in parentheses, and the operator comes first.

- **Standard:**
- **SMT-LIB:** `(= (+ 2 2) 4)`

### 2. Types (Sorts)

SMT-LIB calls types "sorts." Here are the built-in ones:

| Sort | Description | Example Values |
| ---- | ----------- | -------------- |
| `Int` | Arbitrary-precision integers | `0`, `-5`, `42` |
| `Real` | Rational numbers | `1.5`, `(/ 1 3)` |
| `Bool` | Boolean values | `true`, `false` |
| `String` | Unicode strings | `"hello"` |
| `(_ BitVec n)` | Fixed-width bit vectors of n bits | `#b1010`, `#x0F` |
| `(Array K V)` | Maps from key type K to value type V | - |

```lisp
(declare-const i Int)
(declare-const r Real)
(declare-const s String)
(declare-const bv (_ BitVec 8))        ; 8-bit vector
(declare-const arr (Array Int Int))    ; int-indexed array of ints
```

**Type Casting:** Use `to_real` and `to_int` to convert between numeric types:
```lisp
(assert (= (to_real x) 3.0))   ; x must be 3
(assert (= (to_int 3.7) 3))    ; to_int truncates toward zero
```

### 3. Declaring Constants (Variables)

You don't "assign" variables; you declare them so Z3 can find their values.

```lisp
(declare-const x Int)
(declare-const y Int)
(declare-const b Bool)

```

### 4. Assertions (The Rules)

You use `assert` to define the constraints of your problem.

```lisp
(assert (> x 0))              ; x must be positive
(assert (< x 10))             ; x must be less than 10
(assert (= (+ x y) 15))       ; x + y must equal 15

```

### 5. Commands

Once you've defined your variables and rules, you ask Z3 to solve it.

```lisp
(check-sat)   ; Asks: "Is there a solution that satisfies all asserts?"
(get-model)   ; Asks: "If yes, show me the values for the variables."

```

---

## Common Operators

| Category       | Operators                                 | Example                 |
| -------------- | ----------------------------------------- | ----------------------- |
| **Arithmetic** | `+`, `-`, `*`, `/`, `div`, `mod`          | `(+ x (* 2 y))`         |
| **Comparison** | `=`, `>`, `<`, `>=`, `=>`                 | `(>= x 5)`              |
| **Logic**      | `and`, `or`, `not`, `xor`, `=>` (implies) | `(and (> x 0) (not b))` |

## Advanced Constructs

### `distinct` (All-Different Constraint)
Instead of writing `(and (!= x y) (!= x z) (!= y z))`, use `distinct`.

```lisp
(assert (distinct x y z))  ; All must have unique values
```
**Use Case:** Sudoku, scheduling, finding "n distinct numbers."

### `ite` (If-Then-Else)
Functional ternary operator that returns a value based on a condition.

```lisp
(ite <condition> <value_if_true> <value_if_false>)
```
**Rule:** Both return values must be the same type.
**Trick:** Count booleans by converting to integers: `(+ (ite a 1 0) (ite b 1 0))`

### Functions

**`declare-fun`** — Declare an uninterpreted function (Z3 finds what it should return):
```lisp
(declare-fun f (Int) Int)              ; f takes an Int, returns an Int
(declare-fun g (Int Int) Bool)         ; g takes two Ints, returns a Bool

(assert (= (f 5) 10))                  ; constrain f(5) to be 10
(assert (g 3 4))                       ; constrain g(3,4) to be true
```
Uninterpreted functions are consistent: `(= x y)` implies `(= (f x) (f y))`.

**`define-fun`** — Define a function with a concrete body (like a macro):
```lisp
(define-fun square ((x Int)) Int
  (* x x))

(define-fun abs ((x Int)) Int
  (ite (>= x 0) x (- x)))

(define-fun in-range ((x Int) (lo Int) (hi Int)) Bool
  (and (>= x lo) (<= x hi)))

(assert (= (square 5) 25))             ; uses the definition
(assert (in-range y 0 100))
```

**`declare-const` vs `declare-fun`:** `(declare-const x Int)` is shorthand for `(declare-fun x () Int)` — a zero-argument function.

### Quantifiers (`exists` & `forall`)
Define rules without manually declaring every helper variable.

```lisp
; exists: "There is at least one value that makes this true"
(assert (exists ((b Int)) (= x (* b b))))  ; x is a perfect square

; forall: "This rule must hold for every possible value"
(assert (forall ((i Int)) (=> (> i 0) ...)))
```

## Key Concepts to Remember

- **Strong Typing:** You cannot compare an `Int` to a `Real` without casting.
- **Implication (`=>`):** This is huge in SMT. `(assert (=> (> x 10) b))` means "If x is greater than 10, then boolean `b` **must** be true."
- **Unsat:** If your constraints contradict each other (e.g., `x > 5` and `x < 2`), `check-sat` will return `unsat`, and `get-model` will fail.

## Pro-Tips for "Parenthesis Hell"

- **Separation Method:** Skip giant `(assert (and ...))` blocks. Multiple separate `(assert ...)` statements are automatically ANDed together. Much easier to debug.
- **Symmetry Breaking:** When searching for sets of numbers, add `(assert (< n1 n2))` to prevent the solver from wasting time on equivalent orderings (e.g., {3, 4} vs {4, 3}).
