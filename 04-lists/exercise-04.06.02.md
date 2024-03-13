# Exercise 4.6.2

> Declare a polymorphic function `last : ∀ α. L(α) → α` returning the last element of a nonempty lists.

---

We declare this function in OCaml so that we can make use of an exception for the empty list:
```ocaml
let rec last l =
  match l with
  | [] -> failwith "last"
  | [x] -> x
  | x :: l -> last l
```
