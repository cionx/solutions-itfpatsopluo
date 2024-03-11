# Exercise 9.9.8

> Derive mathematical induction from complete induction.

---

Suppose that complete induction holds true.
Let `p(n)` be a proposition about natural numbers and suppose that
1. `p(0)`
2. `∀ n. p(n) → p(n + 1)`

We need to show that `∀ n. p(n)`.
In light of complete induction, it suffices to show the following:
```
∀ n. [ ∀ k < n. p(k) ] → p(n)
```
To this end let `n` be some natural number.
We distinguish between two cases:
- If `n` is zero, then `[ ∀ k < n. p(k) ] → p(n)` holds because `p(0)` is true by property 1.
- If `n >= 1` then `n = m + 1` for another natural number `m`.
  Suppose that `∀ k < n. p(k)`.
  As `m < n`, this entails that `p(m)`.
  It follows from property 2 that `p(m + 1)` is true, i.e., that `p(n)` is true.
  This shows that `[ ∀ k < n. p(k) ] → p(n)`, as desired.
