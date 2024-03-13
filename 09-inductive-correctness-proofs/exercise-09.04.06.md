# Exercise 9.4.6 (Sum of square numbers)

> Define a function `f : N+ → N+` computing the sum `0^2 + 1^2 + ... + n^2` of the square numbers.
> Prove `f(n) = n * (2 n^2 + 3 n + 1) / 6`.

---

We consider the following two functions:
```text
    f : N+ → N+
    f(0) := 0
f(n + 1) := f(n) + (n + 1)^2

    f' : N+ → N+
f'(n) := n * (2 n^2 + 3 n + 1) / 6
```
We show by induction that the functions `f` and `f'` are extensionally equal.

Base case:
```text
  f(0)
= 0^2           definition of f
= 0             algebra
= 0 * ... / 6   algebra
= f'(0)         definition of f'
```
Induction step:
```text
  f(n + 1)
= f(n) + (n + 1)^2                                  definition of f
= f'(n) + (n + 1)^2                                 induction hypothesis
= n (2 n^2 + 3 n + 1) / 6  +  (n + 1)^2             definition of f'
= [n (2 n^2 + 3 n + 1) + 6 (n + 1)^2] / 6           algebra
= [n (2 n^2 + 3 n + 1) + 6 (n^2 + 2 n + 1)] / 6     algebra
= [2 n^3 + 3 n^2 + n + 6 n^2 + 12 n + 6] / 6        algebra
= [2 n^3 + 9 n^2 + 13 n + 6] / 6                    algebra
= (n + 1) (2 n^2 + 7 n + 6) / 6                     algebra
= (n + 1) [(2 n^2 + 4 n + 2) + 3 n + 4] / 6         algebra
= (n + 1) [(2 n^2 + 4 n + 2) + (3 n + 3) + 1] / 6   algebra
= (n + 1) [2 (n^2 + 2 n + 1) + 3 (n + 1) + 1] / 6   algebra
= (n + 1) [2 (n + 1)^2 + 3 (n + 1) + 1] / 6         algebra
= f'(n + 1)                                         definition of f'
```
