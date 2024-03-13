# Exercise 4.5.5 (Inclusion)

> Declare a function
> ```text
> incl : ∀ α. L(α) → L(α) → B
> ```
> which tests whether all elements of the first list are elements of the second list.

---

We use `forall` from Exercise 4.5.3 and `mem` from Exercise 4.5.1:
```text
incl l1 l2 := forall (λ x. mem x l2) l1
```
