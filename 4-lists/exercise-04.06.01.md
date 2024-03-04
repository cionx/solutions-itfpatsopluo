# Exercise 4.6.1

> Define a polymorphic function $\mathit{tl} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha)$ returning the tail of nonempty lists.
> Do not use exceptions.

---

We simply choose the tail of the empty list as empty:
$$
  \begin{gathered}
    \mathit{tl} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \,, \\
    \begin{aligned}
      \mathit{tl} \enspace [\,] &\coloneqq [\,] \,, \\
      \mathit{tl} \enspace (x :: l) &\coloneqq l \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let tl l =
  match l with
  | [] -> []
  | x :: l -> l
```
