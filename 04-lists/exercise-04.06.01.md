# Exercise 4.6.1

> Define a polymorphic function `tl : ∀ α. L(α) → L(α)` returning the tail of nonempty lists.
> Do not use exceptions.

---

We simply choose the tail of the empty list as empty:
```text
tl : ∀ α. L(α) → L(α)
      tl [] := []
tl (x :: l) := l
```
In OCaml code:
```ocaml
let tl l =
  match l with
  | [] -> []
  | x :: l -> l
```
