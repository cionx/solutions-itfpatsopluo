# List construction 6P

> Declare a function `make : ∀ α. N → (N → α) → L(α)` such that `make n f = [f(0), ..., f(n − 1)]`.
> Use only tail recursion.

---

We can declare the function `make` as follows:
```ocaml
let make n f =
  let rec loop k acc =
    if k < 0 then acc
    else loop (k - 1) (f k :: acc)
  in
  loop (n - 1) []
```
