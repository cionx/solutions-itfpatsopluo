# Exercise 1.8.2

> Declare a function `sqrt : N → N` such that `sqrt(n^2) = n` for all `n`.
> Hint:
> Use `first`.

---

We can choose `sqrt n` as the maximal `k` such that `k^2 <= n`.
In other words, the first `k` for which `(k + 1)^2 > n`.
```ocaml
let sqrt n =
  first (fun k -> (k + 1) * (k + 1) > n) 0
```
