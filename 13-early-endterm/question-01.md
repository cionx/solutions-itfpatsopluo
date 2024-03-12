# Euclid’s algorithm 6P

> Declare a function `gcd : N → N → N` computing the GCD of two numbers using the remainder operation `x % y`.
> Use only tail recursion.

---

We can declare the function `gcd` as follows:
```ocaml
let rec gcd x y =
  if y = 0 then x else gcd y (x mod y)
```
