# Fibonacci numbers with iteration 8P

> Recall the sequence of Fibonacci numbers: `0, 1, 1, 2, 3, 5, 8, ...`
> Using iteration, declare a function `fib` that for `n >= 0` yields the `n`th Fibonacci number.
> For instance, `fib(0) = 0`, `fib(1) = 1`, and `fib(4) = 3`.
> Hint:
> `fib(n + 2) = fib(n) + fib(n + 1)`.

---

We can implement `fib` in terms of `iter`:
```ocaml
let fib n =
  let fib' (a, b) = (b, a + b) in
  fst (iter fib' n (0, 1))
```
