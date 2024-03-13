# Exercise 1.12.2 (Sorting triples)

> Declare a function `sort` sorting triples.
> For instance, we want `sort (3, 2, 1) = (1, 2, 3)`.
> Designing such a function is interesting.
> Given a triple `(x, y, z)`, the best solution we know of first ensures `y <= z` and then inserts `x` at the correct position.
> Start from the code snippet
> ```ocaml
> let sort (x, y, z) =
>   let (y, z) = if y <= z then (y, z) else (z, y) in
>   if x <= y then ...
>   else ...
> ```
> where the local declaration ensures `y <= z` using shadowing.

---

We can complete the given code snippet as follows:
```ocaml
let sort (x, y, z) =
  let (y, z) = if y <= z then (y, z) else (z, y) in
  if x <= y then (x, y, z)
  else if x <= z then (y, x, z)
  else (y, z, x)
```
