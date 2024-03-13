# Exercise 4.12.1

> Declare a function `sorted : ∀ α. L(α) → B` that tests whether a list is sorted.
> Use tail recursion.
> Write the function with a generalized match and show how the generalized match translates into simple matches.

---

We can declare the function `sorted` as follows:
```text
           sorted : ∀ α. L(α) → B
           sorted [] := true
          sorted [x] := true
sorted (x :: y :: l) := x <= y && sorted (y :: l)
```
In OCaml code:
```ocaml
let rec sorted l =
  match l with
  | [] -> true
  | [_] -> true
  | x :: y :: l -> x <= y && sorted (y :: l)
```
