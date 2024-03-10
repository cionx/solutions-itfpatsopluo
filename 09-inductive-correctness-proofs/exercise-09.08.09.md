# Exercise 9.8.9

> Argue the correctness of the claims of Fact 9.8.1.

---

We have the following claims to prove:

1. The GCD of two numbers uniquely exists.
2. The GCD of `x` and `x` is `x`.
3. _Zero rule_:
   The GCD of `x` and `0` is `x`.
4. _Symmetry_:
   The GCD of `x` and `y` is the GCD of `y` and `x`.
5. The GCD of two numbers that are not both `0` is the greatest common divisor of the numbers.

### 2.

We have for every number `d` the equivalence
```text
      d | x  and  d | x
<==>  d | x
```
This equivalence tells us that `x` satisfies the defining property of a GCD of `x` and `x`.

### 3.

Every number divides zero.
We have therefore for every number `d` the equivalence
```text
      d | 0  and  d | x
<==>  d | x
```
This equivalence tells us that `x` satisfies the defining property of a GCD of `0` and `x`.

### 4.

Let `g` be a GCD of `x` and `y`.
We have for every number `d` the following sequence of equivalences:
```text
      d | y  and  d | x
<==>  d | x  and  d | y
<==>  d | g
```
These equivalences tell us that `g` satisfies the defining property of a GCD of `y` and `x`.

### 1.

**Lemma 1.**
Let `x` and `y` be two non-negative integers such that `x` divides `y` and `y` divides `x`.
Then `x` equals `y`.

_Proof._
If both `x` and `y` are nonzero, then it follows from `x | y` and `y | x` that `x <= y` and `y <= x`, and thus `x = y`.
If `x` is zero, then it follows from `x | y` that `y` is also zero, and thus `x = y`.
We find in the same way that `x = y` if `y` is zero.

Let now `g1` and `g2` be two GCDs of two numbers `x` and `y`.
The number `g1` is a common divisor of `x` and `y`, and thus a divisor of `g2`.
We find in the same way that `g2` is a divisor of `g1`.
It follows from Lemma 1 that `g1` equals `g2`.
This shows the uniqueness of GCDs.

The existence of GCDs follows from the correctness of Euclid’s algorithm (which relies only on Facts 3 and 4).

### 5.

Let more generally `x` be nonzero and let `y` be any number.

We know from Fact 1 that `x` and `y` admit a GCD `g`.
We know that `g` is nonzero because either `x` or `y` is nonzero.
It therefore follows for every common divisor `d` of `x` and `y` from `d | g` that also `d <= g`.
We hence find that `g` is also the greatest common divisor of `x` and `y`.
