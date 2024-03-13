# Exercise 4.12.2

> Declare a function `perm : ∀ α. L(α) → L(α) → B` that tests whether two lists are equal up to reordering.

---

We can first sort both lists and then check them for equality:
```text
perm : ∀ α. L(α) → L(α) → B
perm l1 l2 := isort l1 = isort l2
```
In OCaml code:
```ocaml
let perm l1 l2 =
  (isort l1) = (isort l2)
```
