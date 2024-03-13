# Exercise 4.8.3

> Declare a function `find_opt : ∀ α. α → L(α) → O(N)` that returns the first position of a list a given value appears at.
> For instance, we want `find_opt 7 [3, 7, 7] = Some 1` and `find_opt 2 [3, 7, 7] = None`.

---

We can declare the function `find_opt` as follows:
```ocaml
let rec find_opt' x l n =
  match l with
  | [] -> None
  | h :: t -> if x = h then Some n else find_opt' x t (n + 1)

let find_opt x l =
  find_opt' x l 0
```
