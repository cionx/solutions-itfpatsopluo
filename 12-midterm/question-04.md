# List construction 8P

> Declare a polymorphic function `init : ∀ α. N → (N → α) → L(α)` such that `init n f = [f(0), ..., f(n − 1)]`.
> For instance, `init f 0 = []` and `init f 2 = [f(0), f(1)]`.
> Use only tail recursion.

---

We can declare the function `init` as follows:
```ocaml
let init n f =
  let rec loop k acc =
    if k < 0 then acc
    else loop (k - 1) (f k :: acc)
  in
  loop (n - 1) []
```
