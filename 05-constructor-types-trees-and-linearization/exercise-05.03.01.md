# Exercise 5.3.1

> Declare a function `tree → string` linearizing AB-trees in OCaml notation.

---

We can declare the three discussed functions as follows:
```ocaml
let rec prefix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "B" ^ (prefix t1) ^ (prefix t2)

let rec postfix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> (postfix t1) ^ (postfix t2) ^ "B"

let rec infix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "(" ^ (infix t1) ^ "B" ^ (infix t2) ^ ")"
```
