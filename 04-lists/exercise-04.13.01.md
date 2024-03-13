# Exercise 4.13.1

Declare a function
```text
reorder : ∀ α β. L(α × β) → L(α × β)
```
that reorders a list of pairs such that the first components of the pairs are
ascending.
If there are several pairs with the same first component, the original order of the pairs should be preserved.
For instance, we want `reorder [(5, 3), (3, 7), (5, 2), (3, 2)] = [(3, 7), (3, 2), (5, 3), (5, 2)]`.
Declare reorder as a one-liner using the sorting function `gisort`.

---

The function `gisort` uses `foldl` instead of `fold`, which we need to counteract by reversing the input list.
We can declare `reorder` as follows:
```text
  reorder : ∀ α β. L(α × β) → L(α × β)
reorder l := gisort (λ p q. π1 p <= π1 q) (rev l)
```

In OCaml code:
```ocaml
let reorder l =
  gisort (fun (x, _) (y, _) -> x <= y) (List.rev l)
```
