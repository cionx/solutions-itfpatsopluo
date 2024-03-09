# Exercise 1.8.1

> Declare a function $\mathit{div}'$ such that $\mathit{div}\;x\;y = \mathit{div}'\;x\;y\;0$ by specializing $\mathit{first}$ to the test $\lambda k. (k + 1) \cdot y > x$.

---

We can declare the such a function $\mathit{div}'$ as follows:
```ocaml
let div' x y n =
  first (fun k -> (k + 1) * y > x) n
```
