# Exercise 2.7.1

> Give derivations for the judgments `{y, z} ⊢ (λ x. x) y` and `∅ ⊢ λ x. x`.
> Explain why the judgment `{x, y} ⊢ z` is not derivable.

---

We have the following derivation for `{y, z} ⊢ (λ x. x) y`:
```text
 ---------------
 {y, z, x}  ⊢  x
-----------------     ------------
{y, z}  ⊢  λ x. x     {y, z}  ⊢  y
----------------------------------
       {y, z}  ⊢ (λ x. x) y
```

We have the following derivation for `∅ ⊢ λ x. x`:
```text
 ---------
 {x}  ⊢  x
------------
∅  ⊢  λ x. x
```

The judgement `{x, y} ⊢ z` does not hold:
the only free variable in the expression `z` is `z`, which is not contained in `{x, y}`.
It is therefore not derivable.
