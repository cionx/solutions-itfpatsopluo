# Exercise 4.9.2

> Declare a function $\mathit{swap} : \forall \alpha \beta. \; \alpha \times \beta \to \beta \times \alpha$ swapping the components of a pair using a simple match expression for tuples.

---

We can declare the function $\mathit{swap}$ as follows:
```ocaml
let swap pair =
  match pair with
  | (x, y) -> (y, x)
```
