# Exercise 3.2.2

> We have the equation
> $$
>   f^{n + 1}(x) = f(f^n(x))
> $$
> providing for an alternative, non-tail-recursive definition of an iteration operator.
> Give the mathematical definition and the declaration in OCaml of an iteration operator using the above equation.

---

The mathematical definition is
$$
  \begin{gathered}
    \mathit{iter} \colon \forall \alpha. (\alpha \to \alpha) \to \mathbb{N} \to \alpha \to \alpha \,, \\
    \begin{aligned}
      \mathit{iter} \; f \; 0 \; x &\coloneqq x \,, \\
      \mathit{iter} \; f \; (n + 1) \; x &\coloneqq f \; (\mathit{iter} \; f \; n \; x) \,.
    \end{aligned}
  \end{gathered}
$$
The declaration in OCaml is as follows:
```ocaml
let rec iter f n x =
  if n = 0 then x else f (iter f (n - 1) x)
```
