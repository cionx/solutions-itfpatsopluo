# Exercise 9.5.2 (Tail-recursive power function)

> Consider the tail-recursive function
> ```text
>       pow : N → N → N → N
>       pow x 0 a := a
> pow x (n + 1) a := pow x n (x * a)
> ```
> Prove `pow x n a = x^n * a` by induction on `n`.
> Note that `a` needs to be quantified in the inductive hypothesis.
> Give the induction predicate.

---

The induction predicate is as follows:
```text
λ n. ∀ x a. pow x n a = x^n * a
```

Base case:
```text
  pow x 0 a
= a           definition of pow
= 1 * a       algebra
= x^0 * a     algebra
```
Induction step:
```text
  pow x (n + 1) a
= pow x n (x * a)   definition of pow
= x^n * x * a       induction hypothesis
= x^(n + 1) * a     algebra
```
