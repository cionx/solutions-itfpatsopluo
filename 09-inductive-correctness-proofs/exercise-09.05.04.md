# Exercise 9.5.4

> There is an alternative proof of the correctness of `fibo` using a lemma for `fibo`.
>
> 1. Prove `fibo (n + 2) a b = fibo n a b + fibo (n + 1) a b`.
> 2. Prove `fib n = fibo n 0 1` by induction on `n` using (1).
>
> Hint: (1) follows by induction on `n` with `a` and `b` quantified.

---

### 1.

We use induction on `n`, with `a` and `b` quantified.
The induction predicate is thus as follows:
```text
λ n. ∀ a b. fibo (n + 2) a b = fibo n a b + fibo (n + 1) a b
```
Let us also recall the definition of `fibo`:
```text
      fibo : N → N → N
      fibo 0 a b := a
fibo (n + 1) a b := fibo n b (a + b)
```

Base case:
```text
  fibo (0 + 2) a b
= fibo 2 a b                      algebra
= fibo 1 b (a + b)                definition of fibo
= fibo 0 (a + b) (a + 2 b)        definition of fibo
= a + b                           definition of fibo
= fibo 0 a b + fibo 0 b (a + b)   definition of fibo
= fibo 0 a b + fibo 1 a b         definition of fib
= fibo 0 a b + fibo (0 + 1) a b   algebra
```
Induction step:
```text
  fibo ((n + 1) + 2) a b
= fibo (n + 3) a b                            algebra
= fibo (n + 2) b (a + b)                      definition of fibo
= fibo n b (a + b) + fibo (n + 1) b (a + b)   induction hypothesis
= fibo (n + 1) a b + fibo (n + 2) a b         definition of fibo
= fibo (n + 1) a b + fibo ((n + 1) + 1) a b   algebra
```

### 2.

We show the proposed equality by induction over `n`.
Let us recall the definition of `fib`:
```text
      fib : N → N
      fib 0 := 0
      fib 1 := 1
fib (n + 2) := fib n + fib (n - 1)
```

Base cases:
```text
  fib 0
= 0             definition of fib
= fibo 0 0 1    definition of fibo
```
```text
  fib 1
= 1             definition of fib
= fibo 0 1 1    definition of fibo
= fibo 1 0 1    definition of fibo
`````
Induction step:
```text
  fib (n + 2)
= fib (n + 1) + fib n             definition of fib
= fibo (n + 1) 0 1 + fib n 0 1    induction hypothesis
= fibo (n + 2) 0 1                part 1 of this exercise
```
