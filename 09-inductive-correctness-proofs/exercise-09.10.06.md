# Exercise 9.10.6

> Consider the function `f : N+ → N → N` defined as
> ```text
> f n k := if k / n = 2 then k else f n (k + 1)
> ```
> 1. Give an invariant `p n k` for `f` holding exactly for the numbers `f` terminates on.
> 2. Give an invariant `p n k` for `f` that is strong enough to show `f n 0 = 2 * n`.

---

### 1.

The function `f n k` terminates if and only if `k < 3 n`, so we may choose `p n k := (k < 3 n)`.

### 2.

We can choose `p n k := (k <= 2 n)`.
