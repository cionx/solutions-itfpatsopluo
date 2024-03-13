# Exercise 1.10.2

> Declare a function `sqrt'` such that `sqrt x = sqrt' x 0` by specializing `first` to the test `λ k. (k + 1)^2 > x`.

---

We can declare the function `sqrt'` as follows:
```text
sqrt' x n := first (λ k. (k + 1)^2 > x) n
```
