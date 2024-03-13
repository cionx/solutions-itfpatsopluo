# Exercise 7.1.1

> Write a tail-recursive faculty function `n!` in Mini-OCaml.
> First write the expression in OCaml, then translate it into the abstract syntax of Mini-OCaml in OCaml.

---

In regular OCaml we can use the following code:
```ocaml
let fac n =
  let rec helper n acc =
    if n = 0 then acc else helper (n - 1) (n * acc)
  in
  helper n 1
```
We can rewrite this code so that can be expressed in Mini-OCaml:
```ocaml
let fac n =
  let rec helper n =
    fun acc ->
      if n <= 0 then acc else helper (n - 1) (n * acc)
  in
  helper n 1
```
