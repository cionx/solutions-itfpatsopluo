# Exercise 9.9.6

Declare a division function following the proof of Fact 9.9.4.
Given `x` and `y` as required, the function should return a quotient-remainder pair `(a, b)` for `x` and `y`.

---

We can declare the described function as follows:
```text
    div : N → N → N × N
div x y := (x, 0)                                     if x < y
div x y := let (a, b) = div (x - y) y in (a + 1, b)   if x >= y
```

**Remark.**
It would be much faster to compute `div x y` as `(x / y, x % y)`.
