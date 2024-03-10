# Exercise 9.9.7

> Prove `fib(n) < 2^n` by complete induction.

---

We prove the inequality by induction over `n`.

Base cases:
```text
  fib 0
= 0       definition of fib
< 1       algebra
= 2^0     algebra

  fib 1
= 1       definition of fib
< 2       algebra
= 2^1     algebra
```
Induction step:
```text
  fib (n + 2)
= fib n + fib (n + 1)     definition of fib
< 2^n + 2^(n + 1)         induction hypothesis
< 2^(n + 1) + 2^(n + 1)   algebra
= 2 * 2^(n + 1)           algebra
= 2^(n + 2)               algebra
```

**Remark.**
For the golden ratio `φ ≈ 1.618…` it can be shown that `fib n` is the closest integer to `φ^n / sqrt 5`.
Since `φ < 2` and `sqrt 5 > 1` we can again see that `fib n < 2^n`.
