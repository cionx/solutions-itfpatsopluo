
# Exercise 2.4.1
> Translate the following concrete expressions into equivalent abstract expressions.
> Use graded projections.
> 1. `let (x, y) = z in x + y`
> 2. `λ f x y . f x y`
> 3. `let rec f x y = if x < 1 then y else f (x − 1) (y + 1) in f 5 6`

---

### 1.

Not sure, maybe `π^2_1 z + π^2_2 z`.

### 2.

An equivalent expression is `λ f. λ x. λ y. (f x) y`.

### 3.

Not sure, maybe
```
let rec f x = λ y . if x < 1 then y else f (x - 1) (y + 1) in (f 5) 6 .
```
