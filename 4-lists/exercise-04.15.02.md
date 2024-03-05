# Exercise 4.15.2

> Declare a function that yields the least prime factor of an integer $x \geq 2$.
> Make sure that at most $\sqrt[2]{x}$ remainder operations are necessary.

---

We are search for the first divisor of $x$ that is larger or equal to $2$.
In OCaml code:
```ocaml
let rec least_prime_factor' k x =
  if k * k > x then x
  else if x mod k = 0 then k
  else least_prime_factor' (k + 1) x

let least_prime_factor x =
  if x < 2 then invalid_arg "least_prime_factor"
  else least_prime_factor' 2 x
```
