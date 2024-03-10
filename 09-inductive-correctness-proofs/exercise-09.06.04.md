# Exercise 9.6.4

> Prove `x^n = it (λ a. a * x) n 1`.

---

We fix the number `x`, and denote the function `λ a. a * x` by `f`.
We show the equality `x^n = it f n 1` by induction over `n`.

Base case:
```text
  it f 0 1
= 1         definition of it
= x^0       algebra
```
induction step:
```text
  it f (n + 1) 1
= f (it f n 1)    definition of it
= f (x^n)         induction hypothesis
= x^n * x         definition of f
= x^(n + 1)       algebra
```
