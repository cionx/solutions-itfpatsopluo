# Exercise 10.3.2 (Binary search for increasing functions)

> Declare a function
> ```text
> search : ∀ α. (N → α) → N → α → O(α)
> ```
> that given an increasing function `f`, a number `n`, and a value `x`, checks whether there is some `i <= n` such that `f(i) = x` using at most `O(log n)` calls of `f`.
> A function `f` is increasing if `f(i) <= f(j)` whenever `i <= j`.

---

We can implement `search` as follows in OCaml:
```ocaml
let rec bsearch f x l r =
  if l > r then None
  else
    let m = (l + r) / 2 in
    let y = f m in
    if x < y then bsearch f x l (m - 1)
    else if x > y then bsearch f x (m + 1) r
    else Some m

let search f n x =
  bsearch f x 0 n
```
