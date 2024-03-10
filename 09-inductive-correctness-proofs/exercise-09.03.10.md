# Exercise 9.3.10 (Tail-recursive list concatenation)

> Define a function `con` concatenating two lists using only tail-recursion whose running time is linear in the length of the first list.

---

This has already been done in Fact 9.3.5.
In OCaml code:
```ocaml
let rec rev_con l1 l2 =
  match l1 with
  | [] -> l2
  | x :: l1 -> rev_con l1 (x :: l2)

let rev l =
  rev_con l []

let con l1 l2 =
  rev_con (rev l1) l2
```
