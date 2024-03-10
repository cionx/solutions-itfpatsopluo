# Exercise 9.7.2

> Let `y > 0`. Prove `x = (x / y) * y + x % y` by function induction on `x / y`.
> First write down the type and the defining equations for `x / y` and `x % y`.

---

The defining equations for integer division and for modulo are as follows:
```text
  / : N → N+ → N
x / y := 0               if x < y
x / y := 1 + (x - y) / y if x >= y
```
```text
  % : N → N+ → N
x % y := x              if x < y
x % y := (x - y) % y    if x >= y
```

We now show the proposed equality by induction.

Base case:
```text
Case x < y.

  (x / y) * y + x % y
= 0 * y + x             definitions of / and %
= x                     algebra
```

Induction step:
```text
Case x >= y.

  (x / y) * y + x % y
= [1 + (x - y) / y] * y + (x - y) % y   definitions of / and %
= y + [(x - y) / y] * y + (x - y) % y   algebra
= y + (x - y)                           induction hypothesis
= x                                     algebra
```
