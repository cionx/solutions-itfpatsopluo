# Exercise 4.12.4 (Sorting with duplicate deletion)

> Declare a function `dsort : ∀ α. L(α) → L(α)` that sorts a list and removes all duplicates.
> For instance, `dsort [5, 3, 2, 5, 2, 3] = [2, 3, 5]`.

---

We first sort the list and then remove duplicates with the following function:
```text
           rm_dup : ∀ α. L(α) → L(α)
           rm_dup [] := []
          rm_dup [x] := [x]
rm_dup (x :: y :: l) := if x = y then rm_dup (y :: l) else x :: rm_dup (y :: l)
```
More explicitly, this function collapses segments of equal elements into a single element.

We can now declare `dsort`:
```text
dsort : ∀ α. L(α) → L(α)
dsort l := rm_dup (isort l)
```
In OCaml code:
```ocaml
let rec rm_dup l =
  match l with
  | [] -> []
  | [x] -> [x]
  | x :: y :: l ->
    let l' = rm_dup (y :: l) in
    if x = y then l' else x :: l'

let dsort l =
  rm_dup (isort l)
```
