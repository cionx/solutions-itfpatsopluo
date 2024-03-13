# Exercise 4.3.3

> Declare a function `flatten : ∀ α. L(L(α)) → L(α)` concatenating the lists appearing as elements of a given list:
> ```text
> flatten [l1, ..., ln]
> =
> l1 @ l2 @ ... @ ln @ []
> ```
> For instance, we want `flatten [[1, 2], [], [3], [4, 5]] = [1, 2, 3, 4, 5]`.

---

A simple, albeit not tail-recursive, declaration is as follows:
```ocaml
let rec flatten lsts =
  match lsts with
  | [] -> []
  | l :: ls -> l @ flatten ls
```
