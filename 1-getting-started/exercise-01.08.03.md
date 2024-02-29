# Exercise 1.8.3

> Declare a terminating function $\mathit{bounded\_first}$ such that $\mathit{bounded\_first} \; f \; n$ yields the first $k \geq 0$ such that $k \leq n$ and $k$ satisfies $f$.

---

We use a worker function $\mathit{bounded\_first}'$ to search for the value $k$.
If no such $k$ can be found, then we return the otherwise invalid output value $-1$.
```ocaml
let rec bounded_first' f n k =
  if k > n then -1
  else if f k then k
  else bounded_first' f n (k + 1)

let bounded_first f n =
  bounded_first' f n 0
```
