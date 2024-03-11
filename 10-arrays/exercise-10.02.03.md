# Exercise 10.2.3

> Declare a function that yields the sum of the elements of an array over `int`.

---

We can declare the described function as follows in OCaml:
```ocaml
let sum arr =
  let n = Array.length arr in
  let rec loop i acc =
    if i >= n then acc else loop (i + 1) (acc + arr.(i))
  in
  loop 0 0
```
