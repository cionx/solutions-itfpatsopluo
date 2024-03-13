# Exercise 1.10.1

> Give a trace for `sqrt 10`.

---

We have the following trace:
```text
  sqrt 10
= first (λ k. (k + 1)^2 > 10) 0       1^2 ≤ 10
= first (λ k. (k + 1)^2 > 10) 1       2^2 ≤ 10
= first (λ k. (k + 1)^2 > 10) 2       3^2 ≤ 10
= first (λ k. (k + 1)^2 > 10) 3       4^2 > 10
= 3
```
