# Exercise 9.4.3 (Little Gauss formula)

> Prove the following equations by induction on `n`.
>
> 1. `0 + 1 + ... + n = n * (n + 1) / 2`
> 2. `0 + 1 + ... + n = sum n`
>
> Equations (1) is known as little Gauss formula and gives us an efficient method to compute the sum of all numbers up to `n` by hand.
> For instance, the sum of all numbers up to `100` is `100 · 101 / 2 = 5050`.
> The second equation tells us that the mathematical notation `0 + 1 + ··· + n` may be defined with the recursive function `sum`.

---

### 1.

Base case:
```text
0 = 0 / 2 = 0 * 1 / 2 = 0 * (0 + 1) / 2
```
Induction step:
```text
  0 + 1 + ... + n + (n + 1)
= n * (n + 1) / 2  +  (n + 1)     induction hypothesis
= (n/2 + 1) * (n + 1)             algebra
= (n + 2)/2 * (n + 1)             algebra
= (n + 1) * (n + 2) / 2           algebra
```

### 2.

Base case:
```text
  sum 0
= 0       definition of sum
```
Induction step:
```text
  sum (n + 1)
= sum n + (n + 1)             definition of sum
= 0 + 1 + ... + n + (n + 1)   induction hypothesis
```
