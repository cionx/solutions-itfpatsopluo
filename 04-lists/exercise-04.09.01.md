# Exercise 4.9.1

> Declare a function testing whether a list starts with the numbers 1 and 2 just using simple match expressions for lists.

---

We can use nested match expressions:
```ocaml
let test l =
  match l with
  | [] -> false
  | x :: l ->
    x = 1 && begin
      match l with
      | [] -> false
      | y :: l -> y = 2
      end
```
