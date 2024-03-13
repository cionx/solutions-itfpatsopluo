# Exercise 9.4.5 (Sum of odd numbers)

> Define a function `f : N+ → N+` computing the sum `1 + 3 + ··· + (2n − 1)` of the odd numbers from `1` to `2n − 1`.
> Prove `f(n) = n^2`.

---

The function `f` can recursively be declared as follows:
```text
    f : N+ → N+
    f(1) := 1
f(n + 1) := f(n) + 2n + 1
```
We consider now the function
```text
f : N+ → N+
f(n) := n^2
```

We show by induction that `f` and `f'` are extensionally equal.

Base case:
```text
  f(1)
= 1       definition of f
= 1^2     algebra
= f'(1)   definition of f'
```
Induction step:
```text
  f(n + 1)
= f(n) + 2n + 1     definition of f
= f'(n) + 2n + 1    induction hypothesis
= n^2 + 2n + 1      definition of f'
= (n + 1)^2         algebra
= f'(n +1)          definition of f'
```
