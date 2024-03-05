# Exercise 4.15.3

> Declare a primality test using at most $\sqrt[2]{x}$ remainder operations for an argument $x \geq 2$.

---

We test that no number $k = 2, 3, \dotsc$ with $k \leq \sqrt[2]{x}$ is a divisor of $x$.
In OCaml code:
```ocaml
let rec prime' k x =
  (k * k > x) || (x mod k <> 0 && prime' (k + 1) x)

let prime x =
  if x < 2 then false else prime' 2 x
```
