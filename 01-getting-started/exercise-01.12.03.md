# Exercise 1.12.3 (Medians)

> The median of three numbers is the number in the middle.
> For instance, the median of `5`, `0`, `1` is `1`.
> Declare a function that takes three numbers and yields the median of the numbers.

---

We can use the same code as in the previous exercise.
```ocaml
let median (x, y, z) =
  let (y, z) = if y <= z then (y, z) else (z, y) in
  if x <= y then y
  else if x <= z then x
  else z
```
