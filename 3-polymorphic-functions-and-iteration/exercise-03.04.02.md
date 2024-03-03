# Exercise 3.4.2

> Declare a primality test based on the fourth characterization (i.e., upper bound $\sqrt[2]{x}$).
> Convince yourself with an OCaml interpreter that testing with upper bound $\sqrt[2]{x}$ is much faster on large primes (check 479,001,599 and 87,178,291,199).

---

We use the following functions:
```ocaml
(** [forall' k p f] checks that [f] holds for all [k, k+1, k+2, ...] as long as
    [p] holds. *)
let rec forall' k p f =
  if not (p k) then true
  else f k && forall' (k + 1) p f

let prime' x =
  x >= 2 && forall' 2 (fun k -> k * k <= x) (fun k -> x mod k <> 0)
```
Testing the given two primes with $\mathit{prime}'$ is (nearly) instantaneous, whereas the original $\mathit{prime}$ function just keeps on running.
