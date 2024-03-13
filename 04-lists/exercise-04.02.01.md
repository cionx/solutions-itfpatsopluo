# Exercise 4.2.1

> Define a function `null : ∀ α. L(α) → B` testing whether a list is the empty list.
> Do not use the equality test.

---

We can use pattern matching:
```text
null : ∀ α. L(α) → B
      null [] := true
null (x :: l) := false
```
