# Exercise 3.3.3

> Functions defined with iteration can always be elaborated into tail-recursive functions not using iteration.
> If the iteration is on pairs, one can use separate accumulator arguments for the components of the pairs.
> Follow this recipe and declare a tail-recursive function $\mathit{fib}'$ such that $\mathit{fib}' \; n \; 0 \; 1 = \mathit{fib}(n)$.

---

We can implement the function $\mathit{fib}'$ as follows:
```ocaml
let rec fib' n a b =
  if n = 0 then a else fib' (n - 1) b (a + b)
```
