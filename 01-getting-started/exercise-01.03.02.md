# Exercise 1.3.2

> Declare functions `int → int → bool` providing the comparisons `x = y`, `x ≠ y`, `x < y`, `x <= y`, `x > y`, and `x >= y`.
> Do this by just using conditionals and comparisons `x <= y`.
> Then realize `x <= y` with `x <= 0` and subtraction.

---

We also use booleans.
We can then declare the given functions as follows:
```ocaml
let equal x y =
  if x <= y then y <= x else false

let unequal x y =
  if x <= y then (if y <= x then false else true) else true

let less x y =
  if x <= y then (if y <= x then false else true) else false

let less_equal x y =
  x <= y

(** Take the declaration for "less" and swap x and y. *)
let greater x y =
  if y <= x then (if x <= y then false else true) else false

(** Take the declaration for "less_equal" and swap x and y. *)
let greater_equal x y =
  y <= x
```

We can realize `x <= y` as follows:
```ocaml
let less_equal' x y =
  x - y <= 0
```
