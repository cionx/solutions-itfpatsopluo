# Exercise 4.7.3

> Define a function $\mathit{pos} : \forall α. \; \mathcal{L}(\alpha) \to \mathbb{Z} \to \mathbb{B}$ testing whether a number is a position of a list.

---

The valid positions for a list of length $n$ are $0, 1, \dotsc, n - 1$:
$$
  \begin{gathered}
    \mathit{pos} : \forall α. \; \mathcal{L}(\alpha) \to \mathbb{Z} \to \mathbb{B} \,, \\
    \mathit{pos} \enspace l \enspace n \coloneqq n \geq 0 \mathbin{\mathtt{\&\&}} n < \mathit{len} \enspace l \,.
  \end{gathered}
$$
In OCaml:
```ocaml
let pos l n =
  n >= 0 && n < List.length l
```
