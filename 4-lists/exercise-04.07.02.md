# Exercise 4.7.2

> Declare a function $\mathit{nth\_checked}$ that raises an invalid-argument exception (see §1.13) if $n < 0$ and otherwise agrees with $\mathit{nth}$.
> Check that your function behaves the same as the predefined function $\mathit{List.nth}$.

---

We can declare $\mathit{nth\_checked}$ as a wrapper around $\mathit{nth}$:
```ocaml
let nth_checked l n =
  if n < 0 then invalid_arg "nth_checked" else nth l n
```
