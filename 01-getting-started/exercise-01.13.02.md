# Exercise 1.13.2 (Sorting triples)

> Recall Exercise 1.12.2.
> With lazy boolean connectives a function sorting triples can be written without much thinking by doing a naive case analysis considering the alternatives $x$ is in the middle or $y$ is in the middle or $z$ is in the middle.

---

We can brute force our way through all six possibilities:
```ocaml
let sort (x, y, z) =
  if x <= y && y <= z then (x, y, z)
  else if x <= z && z <= y then (x, z, y)
  else if y <= x && x <= z then (y, x, z)
  else if y <= z && z <= x then (y, z, x)
  else if z <= x && x <= y then (z, x, y)
  else (z, y, x)
```
