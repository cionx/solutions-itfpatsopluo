# Exercise 1.7.1

> Define a function `N → N` that terminates for even numbers and diverges for odd numbers.

---

We can consider the function
```text
   f : N → N
f(n) := n       if n is even
f(n) := f(n)    if n is odd
```
