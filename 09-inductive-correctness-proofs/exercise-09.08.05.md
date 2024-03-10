# Exercise 9.8.5

> Define a function `g : N → N → N` computing the GCD of two numbers whose recursion decreases the first argument.

---

We use the same approach as for `gcd`, but swap the role of the two arguments:
```text
g : N → N → N
g 0 y := y
g x y := g (y % x) x
```
