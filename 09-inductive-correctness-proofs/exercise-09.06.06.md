# Exercise 9.6.6

> Prove the shift law for `iter` in two ways:
> 1. by a direct inductive proof, and
> 2. using the agreement with `it` and the shift law for `it`.

---

The shift law for `iter` is as follows:
```text
f (iter f n x) = iter f n (f x)
```

### 1.

The induction proposition is as follows:
```text
λ n. ∀ x. f (iter f n x) = iter f n (f x)
```

Base case:
```text
  f (iter f 0 x)
= f x               definition of iter
= iter f 0 (f x)    definition of iter
```
Induction step:
```text
  f (iter f (n + 1) x)
= f (iter f n (f x))    definition of iter
= iter f n (f (f x))    induction hypothesis
= iter f (n + 1) (f x)  definition of iter
```

### 2.

We have the following sequence of equalities:
```text
  f (iter f n x)
= f (it f n x)    agreement of iter and it
= it f n (f x)    shift law for it
= iter f n (f x)  agreement of iter and it
```
