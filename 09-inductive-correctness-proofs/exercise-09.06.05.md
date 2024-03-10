# Exercise 9.6.5

> Recall the Fibonacci function `fib` from §9.5.
> Prove `(fib n, fib (n + 1)) = it f n (0, 1)` for `f (a, b) := (b, a + b)`.

---

The Fibonacci function is defined as follows:
```text
      fib : N → N
      fib 0 := 0
      fib 1 := 1
fib (n + 2) := fib n + fib (n + 1)
```

We show the proposed equality `(fib n, fib (n + 1)) = it f n (0, 1)` by induction over `n`.

Base case:
```text
  (fib 0, fib (0 + 1))
= (fib 0, fib 1)        algebra
= (0, 1)                definition of fib
= it f 0 (0, 1)         definition of it
```
Induction step:
```text
  (fib (n + 1), fib ((n + 1) + 1))
= (fib (n + 1), fib (n + 2))            algebra
= (fib (n + 1), fib n + fib (n + 1))    definition of fib
= f (fib n, fib (n + 1))                definition of f
= f (iter n f (0, 1))                   induction hypothesis
= iter (n + 1) f (0, 1)                 definition of iter
```
