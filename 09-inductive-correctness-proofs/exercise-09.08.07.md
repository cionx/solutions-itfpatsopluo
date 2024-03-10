# Exercise 9.8.7

> Define a function `g : N+ → N+ → N+` computing the GCD of two positive numbers using the remainder function.
> Argue the correctness of your function.
> Use only one conditional.

---

We can declare the function `g` as follows:
```text
    g : N+ → N+ → N+
g x y := if x % y = 0 then y else g y (x % y)
```
The function `g` terminates since each recursive function call strictly decreases the second argument.
The correctness of `g` follows from the modulo rule.
