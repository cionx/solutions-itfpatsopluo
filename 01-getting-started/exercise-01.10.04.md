# Exercise 1.10.4

> Let `y > 0`.
> Convince yourself that `λ x. x / y` inverts the strictly increasing function `λ n. n * y`.

---

We have for every number `n` the algebraic identity `(n * y) / y = n`, as can be shown by induction over `n`.
This observation means precisely that `λ x. x / y` is a left-inverse to `λ n. n * y`.
