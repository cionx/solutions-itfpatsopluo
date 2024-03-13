# Strictly ascending lists 7P

> Declare a tail-recursive function `test : ∀ α. L(α) → B` testing whether a list is strictly ascending.
> A list `[x1, x2, ..., xn]` is strictly ascending if `x1 < x2 < ... < xn`.

---

We can declare the function `test` as follows:
```ocaml
let rec test l = match l with
  | [] | [_] -> true
  | x :: y :: l -> x < y && test (y :: l)
```
