# Exercise 4.11.1

> Using `fold`, declare functions that yield the concatenation, the flattening, the length, and the reversal of lists.

---

This has already been done in the book, on the same page as the exercise.
We repeat the formulas for completeness:
```text
  l1 @ l2 = fold cons l1 l2
flatten l = fold ( @ ) l []
 length l = fold (λ x a. 1 + a) l 0
    rev l = fold (λ x a. a @ [x]) l []
```
