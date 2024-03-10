# Exercise 9.8.6

> Define a function `g : N → N → N` computing the GCD of two numbers using subtraction and not using the remainder operation.
> Argue the correctness of your function.
> Hint:
> Define the function such that recursion decreases the sum of the two arguments.

---

We can declare such a function `g` as follows:
```text
g : N → N → N
g x 0 := x
g 0 y := y
g x y := if x <= y then g x (y - x) else g (x - y) y
```
The function `g x y` terminates since the sum `x + y` strictly decreases in each function call.
The correctness of `g` follows from the subtraction rule.
