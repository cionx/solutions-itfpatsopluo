# Exercise 4.7.4

> Declare a function `find : ∀ α. α → L(α) → N` that returns the first position of a list a given value appears at.
> For instance, we want `find 1 [3, 1, 1] = 1`.
> If the value doesn’t appear in the list, a failure exception should be raised.

---

We iterate over the list and use an auxiliary function `find'` to also keep track of the current position:
```ocaml
let rec find' x l n =
  match l with
  | [] -> failwith "find"
  | h :: t -> if h = x then n else find' x t (n + 1)

let find x l =
  find' x l 0
```
