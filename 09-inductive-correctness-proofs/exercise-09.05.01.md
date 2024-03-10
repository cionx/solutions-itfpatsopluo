# Exercise 9.5.1 (Tail-recursive factorial function)

> Consider the tail-recursive function
> ```text
>       fac : N → N → N
>       fac 0 a := a
> fac (n + 1) a := fac n ((n + 1) * a)
> ```
> Prove `fac n a = a * n!` by induction on `n` assuming the equations `0! = 1` and `(n + 1)! = (n + 1) * n!`.
> Note that a needs to be quantified in the inductive hypothesis.
> Give the induction predicate.

---

The induction predicate is as follows:
```text
λ n. ∀ a. fac n a = a * n!
```

Base case:
```text
  fac 0 a
= a         definition of fac
= a * 1     algebra
= a * 0!    definition of factorial
```
Induction step:
```text
  fac (n + 1) a
= fac n ((n + 1) * a)   definition of fac
= (n + 1) * a * n!      definition of fac
= a * (n + 1) * n!      algebra
= a * (n + 1)!          definition of factorial
```
