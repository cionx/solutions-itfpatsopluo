# Exercise 4.9.2

> Declare a function `swap : ∀ α β. α × β → β × α` swapping the components of a pair using a simple match expression for tuples.

---

We can declare the function `swap` as follows:
```ocaml
let swap (x, y) = (y, x)
```
