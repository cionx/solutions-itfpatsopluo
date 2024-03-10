# Exercise 9.4.4 (Running time functions)

> In Chapter 8, we derived the following running time functions:
> ```text
>     r1(0) := 1
> r1(n + 1) := 1 + r1(n)
>
>     r2(0) := 1
> r2(n + 1) := 1 + r2(n) + (n + 1)
>
>     r3(0) := 1
> r3(n + 1) := 1 + r3(n) + r3(n)
> ```
> Using a recurrence solver, we obtained explicit characterizations of the
> functions:
> ```text
> r1(n) = n + 1
> r2(n) = (n + 1) (n + 2) / 2
> r3(n) = 2^(n + 1) − 1
> ```
> Use mathematical induction to verify the correctness of the explicit characterizations.
> Note that the proof obligations imposed by mathematical induction boil down to checking that the explicit characterizations satisfy the defining equations of the running time functions.

---

We denote the proposed explicit formulas by `r1'`, `r2'` and `r3'`.

### `r1` and `r1'`

Base case:
```text
  r1(0)
= 1       definition of r1
= 0 + 1   algebra
= r1'(0)  definition of r1'
```
Induction step:
```text
  r1(n + 1)
= 1 + r1(n)     definition of r1
= 1 + r1'(n)    induction hypothesis
= 1 + (n + 1)   definition of r1'
= (n + 1) + 1   algebra
= r1'(n + 1)    definition of r1'
```

### `r2` and `r2'`

Base case:
```text
  r2(0)
= 1                       definition of r2
= 1 * 2 / 2               algebra
= (0 + 1) * (0 + 2) / 2   algebra
= r2'(0)                  definition of r2'
```
Induction step:
```text
  r2(n + 1)
= 1 + r2(n) + (n + 1)                     definition of r2
= 1 + r2'(n) + (n + 1)                    induction hypothesis
= 1 + (n + 1) (n + 2) / 2 + (n + 1)       definition of r2'
= [2 + (n + 1) (n + 2) + 2 (n + 1)] / 2   algebra
= (2 + n^2 + 3n + 2 + 2n + 2) / 2         algebra
= (n^2 + 5n + 6) / 2                      algebra
= (n + 2) (n + 3) / 2                     algebra
= ((n + 1) + 1) ((n + 1) + 2) / 2         algebra
= r2'(n + 1)                              definition of r2'
```

### `r3` and `r3'`

Base case:
```text
  r3(0)
= 1               definition of r3
= 2 - 1           algebra
= 2^1 - 1         algebra
= 2^(0 + 1) - 1   algebra
= r3'(0)          definition of r3'
```
Induction step:
```text
  r3(n + 1)
= 1 + r3(n) + r3(n)         definition of r3
= 1 + 2 * r3(n)             algebra
= 1 + 2 * r3'(n)            induction hypothesis
= 1 + 2 * (2^(n + 1) - 1)   definition of r3'
= 1 + 2 * 2^(n + 1) - 2     algebra
= 2^(n + 2) - 1             algebra
= 2^((n + 1) + 1) - 1       algebra
= r3'(n + 1)                definition of r3'
```
