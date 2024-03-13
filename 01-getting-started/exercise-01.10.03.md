# Exercise 1.10.3

> The ceiling operator `⌈x⌉` converts a real number into the least integer `y` such that `x <= y`.
> 1. Declare a function computing rounded down cube roots `⌊³√x⌋`.
> 2. Declare a function computing rounded up cube roots `⌈³√x⌉`.

---

### 1.

The rounded down cube root `⌊³√x⌋` is the largest integer `k` for which `k^3 <= x`, and thus the first integer `k` with `k >= 0` and `(k + 1)^3 > x`.
We can therefore declare the described function as follows:
```text
  cbrt : N → N
cbrt x := first (λ k. (k + 1)^3 > x) 0
```

### 2.

The rounded up cube root `⌈³√x⌉` is the smallest integer `k` with `k^3 >= x`.
We can therefore declare the described function as follows:
```text
  cbrt' : N → N
cbrt' x := first (λ k. k^3 >= x) 0
```
