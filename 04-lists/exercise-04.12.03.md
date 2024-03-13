# Exercise 4.12.3 (Sorting into descending order)

> Declare a function `sort_desc : ∀ α. L(α) → L(α)` that reorders a list such that the elements appear in descending order.
> For instance, we want `sort_desc [5, 3, 2, 5, 2, 3] = [5, 5, 3, 3, 2, 2]`.

---

We can first sort the list in ascending order and then reverse the result:
```text
sort_desc : ∀ α. L(α) → L(α)
sort_desc l := rev (isort l)
```
In OCaml code:
```ocaml
let sort_desc l =
  List.rev (isort l)
```
