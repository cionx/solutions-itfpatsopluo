# Prime factorization 10P

> Declare a function `pfac : N → N → L(N)` such that `pfac x 2` computes the prime factorization of `x >= 2`.
> Do not use helper functions.
> Give the invariant `pfac` must satisfy so that `pfac x k` computes the prime factorization of `x`.

---

We can declare the function `pfac` as follows:
```ocaml
let rec pfac x k =
  if k * k > x then [x]
  else if x mod k = 0 then k :: pfac (x / k) k
  else pfac x (k + 1)
```

The following invariant ensures that `pfac x k` computes the prime factorization of `x`:
- `x >= 2`, and
- `k >= 2` must not be less or equal to the smallest prime factor of `x`.
