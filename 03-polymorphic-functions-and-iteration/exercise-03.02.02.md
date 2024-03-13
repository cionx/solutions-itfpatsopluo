# Exercise 3.2.2

> We have the equation
> ```text
> f^(n + 1)(x) = f(f^n(x))
> ```
> providing for an alternative, non-tail-recursive definition of an iteration operator.
> Give the mathematical definition and the declaration in OCaml of an iteration operator using the above equation.

---

The mathematical definition is
```text
iter : ∀ α. (α → α) → N → α → α
      iter f 0 x := x
iter f (n + 1) x := f (iter f n x)
```
The declaration in OCaml is as follows:
```ocaml
let rec iter f n x =
  if n = 0 then x else f (iter f (n - 1) x)
```
