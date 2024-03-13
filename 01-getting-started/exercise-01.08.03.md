# Exercise 1.8.3

> Declare a terminating function `bounded_first` such that `bounded_first f n` yields the first `k >= 0` such that `k <= n` and `k` satisfies `f`.

---

We use a worker function `bounded_first'` to search for the value `k`.
If no such `k` can be found, then we return the otherwise invalid output value `-1`.
```ocaml
let rec bounded_first' f n k =
  if k > n then -1
  else if f k then k
  else bounded_first' f n (k + 1)

let bounded_first f n =
  bounded_first' f n 0
```
