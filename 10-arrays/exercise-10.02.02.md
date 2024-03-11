# Exercise 10.2.2

> OCaml offers a predefined function `Array.init` such that `Array.init n f` allocates an array with initial state `List.init n f`.
> Declare such an init function for arrays using neither `List.init` nor `Array.of_list`.
> Use only tail recursion.

---

We can declare the described function as follows in OCaml:
```ocaml
let init n f =
  if n = 0 then [||]
  else
    let arr = Array.make n (f 0) in
    let rec loop i =
      if i >= n then arr else (arr.(i) <- f i; loop (i + 1))
    in
    loop 1
```
