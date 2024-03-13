# Exercise 1.10.5

> Declare inverse functions for the following functions:
> 1. `λ n. n^3`,
> 2. `λ n. n^k` for `k >= 2`,
> 3. `λ n. k^n` for `k >= 2`.

---

### 1.

We can use the rounded-down cube root function from Exercise 1.10.3:
```ocaml
  cbrt : N → N
cbrt x := first (λ k. (k + 1)^3 > x) 0
```

### 2.

We can use the rounded-down root function `⌊ᵏ√x⌋`:
```text
  root : N → N
root x := first (λ n. (n + 1)^k > x) 0
```

### 3.

We can use the rounded-down logarithm function `⌊log_k x⌋`:
```text
  log : N → N
log x := first (λ n. k^(n + 1) > x) 0
```
