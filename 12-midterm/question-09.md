# AB-tree construction 8P

> Declare a function `ctree` that for a number `n >= 0` yields an AB-tree of depth `n` and size `2n + 1`.
> For instance, `ctree(1) = B(A, A)`.

---

We can declare the function `ctree` as follows:
```ocaml
let rec ctree n =
  if n <= 0 then A else B (A, ctree (n - 1))
```
