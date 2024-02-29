# Exercise 1.3.2

> Declare functions $\mathit{int} \to \mathit{int} \to \mathit{bool}$ providing the comparisons $x = y$, $x \neq y$, $x < y$, $x \leq y$, $x > y$, and $x \geq y$.
> Do this by just using conditionals and comparisons $x \leq y$.
> Then realize $x \leq y$ with $x \leq 0$ and subtraction.

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

We can realize $x \leq y$ as follows:
```ocaml
let less_equal' x y =
  x - y <= 0
```
