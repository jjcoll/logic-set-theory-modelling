# Z3 / SMT-LIB Basic Syntax

### 1. The Core Logic

SMT-LIB uses **Lisp-style prefix notation** (S-expressions). Erything is wrapped in parentheses, and the operator comes first.

- **Standard:**
- **SMT-LIB:** `(= (+ 2 2) 4)`

### 2. Declaring Constants (Variables)

You don't "assign" variables; you declare them so Z3 can find their values.

```lisp
(declare-const x Int)
(declare-const y Int)
(declare-const b Bool)

```

### 3. Assertions (The Rules)

You use `assert` to define the constraints of your problem.

```lisp
(assert (> x 0))              ; x must be positive
(assert (< x 10))             ; x must be less than 10
(assert (= (+ x y) 15))       ; x + y must equal 15

```

### 4. Commands

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

## Key Concepts to Remember

- **Strong Typing:** You cannot compare an `Int` to a `Real` without casting.
- **Implication (`=>`):** This is huge in SMT. `(assert (=> (> x 10) b))` means "If x is greater than 10, then boolean `b` **must** be true."
- **Unsat:** If your constraints contradict each other (e.g., `x > 5` and `x < 2`), `check-sat` will return `unsat`, and `get-model` will fail.
