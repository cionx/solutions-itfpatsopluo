# Exercise 9.9.5

> Declare a prime factorization function following the proof of Fact 9.9.3.

---

To use the approach from the proof of Fact 9.9.3 we need to be able to
- decide if a number `x` is prime, and if not then
- find a proper factor of `x`.

The easiest way to finding a proper factor of `x` is by determining the smallest proper factor `p` of `x`.
However, this is then automatically the smallest prime factor of `x`, so we are back to the algorithm from Section 4.15.

In other words, we don’t know how to solve this exercise without
- intentionally writing bad code, or
- implementing the algorithm from Section 4.15 instead.
