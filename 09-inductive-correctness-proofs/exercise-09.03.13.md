# Exercise 9.3.13 (Tail-recursive length of lists)

> Consider the tail-recursive function
> ```text
>       len [] a = a
> len (x :: l) a = len l (a + 1)
> ```
> Prove `len l a = a + length l` by induction on `l`.
> Note that `a` needs to be quantified in the inductive hypothesis.
> Give the induction predicate.

---

The induction predicate is as follows:
```text
λ l. ∀ a. len l a = a + length l
```

Base case:
```text
  len [] a
= a               definition of len
= a + 0           algebra
= a + length []   definition of length
```
Induction step:
```text
  len (x :: l) a
= len l (a + 1)         definition of len
= a + 1 + length l      induction hypothesis
= a + length (x :: l)   definition of len
```
