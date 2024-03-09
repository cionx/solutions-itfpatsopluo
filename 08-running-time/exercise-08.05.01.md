# Exercise 8.5.1

> The binary search function can be simplified if it returns booleans rather than options.
> Declare a binary search function checking whether $f$ yields a given value for some number in a given interval.
> Use the lazy boolean connectives.

---

We can use the following function:
```ocaml
let rec has_value f x l r =
  l <= r
  &&
  let m = (l + r) / 2 in
  let y = f m in
  if x < y then has_value f x l (m - 1)
  else if x > y then has_value f x (m + 1) r
  else true
```
